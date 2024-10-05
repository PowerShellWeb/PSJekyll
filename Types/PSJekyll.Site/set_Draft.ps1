param()

$unrolledArguments = @($args | . { process { $_ } })
$currentName = ''

filter toMarkdownFileName {
    $_ -replace '(?:\.md)?$', '.md' -replace '[\s\p{P}]','-'
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
if (-not $metadata.date) {
    $metadata.date = [DateTime]::Now.ToString("yyyy-MM-dd HH:mm:ss K")
}



Set-Content -Path (
    $this.Directory,"_drafts",($Name | toMarkdownFileName) -join ([IO.Path]::DirectorySeparatorChar) -replace '^\\'
) -Value $(
    @(
        $metadata | & $psJekyll.FormatYaml.Script -YamlHeader
        $content
    ) -join [Environment]::NewLine
)