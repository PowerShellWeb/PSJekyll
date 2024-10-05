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



Set-Content -Path (
    $this.Directory,"_layouts",($Name | toFileName) -join ([IO.Path]::DirectorySeparatorChar) -replace '^\\'
) -Value $(
    @(
        $metadata | & $psJekyll.FormatYaml.Script -YamlHeader
        $content
    ) -join [Environment]::NewLine
)