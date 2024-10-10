<#
.SYNOPSIS
    Sets an include file.
.DESCRIPTION
    Sets an include file in a Jekyll site.

    Include files are used to include content inline in a page.
.LINK
    https://jekyllrb.com/docs/includes/
#>
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
# Includes cannot have front matter.
$destinationContent = $content

New-Item -Path $destinationPath -ItemType File -Value $destinationContent -Force
