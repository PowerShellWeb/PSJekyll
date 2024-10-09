<#
.SYNOPSIS
    Sets a draft in a Jekyll site.
.DESCRIPTION
    Sets a draft in a Jekyll site, using PowerShell.
    
    This will create a new draft in the `_drafts` folder.

    If no metadata is provided, it will default to the current date and the title of the draft.
#>
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
if (-not $metadata.title) {
    $metadata.title = $Name -replace '\.+?$'
}

New-Item -Path (
    $this.Directory,"_drafts",($Name | toMarkdownFileName) -join 
        ([IO.Path]::DirectorySeparatorChar) -replace 
            '^\\' -replace '[\\/]', [IO.Path]::DirectorySeparatorChar
) -Force -Value $(
    @(
        $metadata | & $psJekyll.FormatYaml.Script -YamlHeader
        $content
    ) -join [Environment]::NewLine
)