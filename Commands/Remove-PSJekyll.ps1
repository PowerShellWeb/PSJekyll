function Remove-PSJekyll {    
    <#
    .SYNOPSIS
        Removes content from Jekyll
    .DESCRIPTION
        Removes files from Jekyll

        This is a slightly limited version of Remove-Item.
    #>
    [Alias('Remove-Jekyll')]
    param(
    # The path to the file.
    [Parameter(Mandatory,Position=0,ValueFromPipelineByPropertyName)]    
    [ValidatePattern('^[\\/]')]
    [Alias('FullName')]
    [string]
    $Path
    )
    
    process {
        if (Test-Path $path) {        
            Remove-Item -Path $path         
        }
    }        
}
