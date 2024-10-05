param()

$unrolledArguments = @($args | . { process { $_ } })
$currentName = ''

filter toJsonFileName {
    $_ -replace '(?:\.json)?$', '.json'
}

foreach ($arg in $unrolledArguments) {
    if ($arg -is [Collections.IDictionary]) {
        
        foreach ($keyValue in $arg.GetEnumerator()) {            
            $targetPath = $this.Directory,"_data",($keyValue.Key | toJsonFileName) -join ([IO.Path]::DirectorySeparatorChar)
            if (-not (Test-Path $targetPath)) {
                $null = New-Item -Path $targetPath -ItemType File -Force
            }
            Set-Content -Path $targetPath -Value (
                ConvertTo-Json -Depth $FormatEnumerationLimit -InputObject $($keyValue.Value)
            )
        }
    }
    elseif ($arg -is [string]) {
        $currentName = $arg
    }
    elseif ($currentName) {
        $targetPath = $this.Directory,"_data",($currentName | toJsonFileName) -join ([IO.Path]::DirectorySeparatorChar)
        if (-not (Test-Path $targetPath)) {
            $null = New-Item -Path $targetPath -ItemType File -Force
        }
        Set-Content -Path $targetPath -Value (
            ConvertTo-Json -Depth $FormatEnumerationLimit -InputObject $arg
        )
            
    }
}
