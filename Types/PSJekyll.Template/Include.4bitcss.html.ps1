param(
[string]
$PaletteName
)

if ($PaletteName) {
@"
<link rel="stylesheet" id="4bitcss" type="text/css" href="https://cdn.jsdelivr.net/gh/2bitdesigns/4bitcss@latest/css/$($PaletteName -replace '\.css$').css" />
"@
} else {
    @(
        "{% if page.palette %}"
            '<link rel="stylesheet" type="text/css" id="4bitcss" href="https://cdn.jsdelivr.net/gh/2bitdesigns/4bitcss@latest/css/{{page.palette}}.css" />'
        "{% elsif site.palette %}"
            '<link rel="stylesheet" type="text/css" id="4bitcss" href="https://cdn.jsdelivr.net/gh/2bitdesigns/4bitcss@latest/css/{{site.palette}}.css" />'
        "{% endif %}"
    ) -join [Environment]::Newline
}


