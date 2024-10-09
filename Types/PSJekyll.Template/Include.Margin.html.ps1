<#
.SYNOPSIS
    Includes site margins
.DESCRIPTION
    Includes site margins in the site.
    
    This will add a style tag with the margin.  It should be located in the head of the site.

    If the margin parameter is provided, it will be used.  
    
    Otherwise, the `page.margin` or `site.margin` will be used.

    If neither margin exists, it will default to a margin of `1em` for all elements, 
    and `0.5em` for all elements when the screen is less than `960px`.
#>
param(
# The margin to include.
[string]
$Margin
)

if ($margin) {
    "<style type='text/css' id='globalMargin'>$margin</style>" 
} else {
    @(
        "{% if page.margin %}"
            "<style id='globalMargin' type='text/css'>{{page.margin}}</style>"
        "{% if site.margin %}"
            "<style id='globalMargin' type='text/css'>{{site.margin}}</style>"
        "{% else %}"
@"
<style type='text/css' id='globalMargin'>
body > * { margin: 1em; }                
@media (max-width: 960px) {
    body > * { margin: .5em; }
}
</style>
"@
        "{% endif %}"
    ) -join [Environment]::Newline
}
