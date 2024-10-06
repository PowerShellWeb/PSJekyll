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
    "<style type='text/css'>body { margin: $margin } </style>" 
} else {
    @(
        "{% if site.margin %}"
            "<style type='text/css'>body > * { margin: {{site.margin}} } </style>"
        "{% else %}"
            "<style type='text/css'>body > * { margin: 2.5% } </style>"
        "{% endif %}"
    ) -join [Environment]::Newline
}
