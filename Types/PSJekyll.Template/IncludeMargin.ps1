<#
.SYNOPSIS
    Includes site margins
.DESCRIPTION
    Includes site margins in the site.
    
    This will add a style tag with the margin.  It should be located in the head of the site.

    If the margin parameter is provided, it will be used.  Otherwise, the site.margin will be used.
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
