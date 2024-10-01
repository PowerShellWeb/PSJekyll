function Set-PSJekyll {    
    <#
    .SYNOPSIS
        Sets the content of a file in Jekyll
    .DESCRIPTION
        Sets the content of a file in Jekyll.

        This is only slightly smarter than Set-Content.  
        
        It will convert the content to JSON if the file ends in .json, and to CSV if the file ends in .csv or .tsv.

        Otherwise, it will create a YAML header and then set the content.
    #>
    [Alias('Set-Jekyll')]
    param(
    # The path to the file.
    [Parameter(Mandatory,Position=0)]    
    [ValidatePattern('^[\\/]')]
    [Alias('FullName')]
    [string]
    $Path,
    
    # If set, will return the file object
    [switch]
    $PassThru,
    
    # The content to set
    [Parameter(ValueFromPipeline)]
    [object]
    $Content,

    # Any metadata to set.  
    # This will create a YAML header, which is required for most files in Jekyll to be processed properly.
    [Alias('YamlHeader')]
    [Collections.IDictionary]
    $MetaData = [Ordered]@{}
    )
    
    $allInput = @($input)
    if ((-not $allInput) -and $Content) {
        $allInput = @($Content)
    }
    
    if ($path -match '\.json$') {
        if ($allInput.Length -eq 1) {         
            ConvertTo-Json -InputObject $allInput[0] -Depth $FormatEnumerationLimit | 
                Set-Content -Path $path
        } else {
            ConvertTo-Json -InputObject $allInput -Depth $FormatEnumerationLimit | 
                Set-Content -Path $path
        } 
    } 
    elseif ($path -match '\.[ct]sv$') {
        $csvSplat = [Ordered]@{Path=$path}
        if ($path -match '\.t') {
            $csvSplat.Delimiter = "`t"
        }
        $content | 
            Export-Csv @csvSplat  -NoTypeInformation 
    }
    else {
        @(
            $metadata | & $psJekyll.FormatYaml.Script -YamlHeader
            $content
        ) | 
            Set-Content -Path $path
    }
    if ($? -and $PassThru) {
        Get-Item -Path $path
    }
}
