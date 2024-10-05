param()

$unrolledArguments = @($args | . { process { $_ } })

filter toFileName {
    $_ -replace '[<>\|\?\*:]', '-' -replace '\s','-'
}

$name, $content, $metdata = $null, $null, $null

foreach ($arg in $unrolledArguments) {
    if ($arg -is [Collections.IDictionary]) {
        $metadata = $arg        
    }
    elseif ($arg -is [string] -and -not $name) {
        $Name = $arg
    }
    elseif ($arg -is [string] -and -not $content) {
        $content = $arg            
    }
}

if (-not $metadata) {
    $metadata = [Ordered]@{}
}
if (-not $metadata.title) {
    $metadata.title = $Name
}


$destinationPath = $this.Directory,"_includes",($Name | toFileName) -join ([IO.Path]::DirectorySeparatorChar) -replace '^\\'
$destinationContent = $(
    @(
        $metadata | & $psJekyll.FormatYaml.Script -YamlHeader
        $content
    ) -join [Environment]::NewLine
)

if (-not (Test-Path $destinationPath)) {
    New-Item -Path $destinationPath -ItemType File -Value $destinationContent -Force
} else {
    Set-Content -Path $destinationPath -Value $destinationContent
}