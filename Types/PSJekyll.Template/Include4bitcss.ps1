param(
[string]
$PaletteName
)

if ($PaletteName) {
@"
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/2bitdesigns/4bitcss@latest/css/$($PaletteName -replace '\.css$').css" />
"@
} else {
    @(
        "<% if site.palette %>"
        '<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/2bitdesigns/4bitcss@latest/css/{{site.palette}}.css" />'
        "<% endif %>"
    ) -join [Environment]::Newline
}


