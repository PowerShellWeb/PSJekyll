<#
.SYNOPSIS
    Sets data files in a Jekyll site
.DESCRIPTION
    Sets data files in a Jekyll site, using PowerShell.

    Data files are a simple and powerful way to add custom data to your site. 
    
    Simply use this to set a property, and the data will be available in Jekyll within `site.data`
#>
param()

$unrolledArguments = @($args | . { process { $_ } })
$currentName = ''

filter toJsonFileName {
    $_ -replace '(?:\.json)?$', '.json'
}

foreach ($arg in $unrolledArguments) {
    if ($arg -is [Collections.IDictionary]) {        
        foreach ($keyValue in $arg.GetEnumerator()) {            
            $targetPath = 
                $this.Directory,"_data",($keyValue.Key | toJsonFileName) -join 
                    [IO.Path]::DirectorySeparatorChar -replace 
                        '[\\/]', [IO.Path]::DirectorySeparatorChar

            New-Item -Path $targetPath -ItemType File -Force -Value (
                ConvertTo-Json -Depth $FormatEnumerationLimit -InputObject $($keyValue.Value)
            )
        }
    }
    elseif ($arg -is [string]) {
        $currentName = $arg
    }
    elseif ($currentName) {
        $targetPath = $this.Directory,"_data",($currentName | toJsonFileName) -join 
            [IO.Path]::DirectorySeparatorChar -replace 
                '[\\/]', [IO.Path]::DirectorySeparatorChar
        New-Item -Path $targetPath -ItemType File -Force -Value (
            ConvertTo-Json -Depth ($FormatEnumerationLimit * 2) -InputObject $arg
        )            
    }
}
