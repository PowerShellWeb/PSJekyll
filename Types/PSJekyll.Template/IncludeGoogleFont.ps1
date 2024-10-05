<#
.SYNOPSIS
    Includes a Google Font.
.DESCRIPTION
    Includes a Google Font in the site.
    
    This will add a link to the Google Font.  It should be located in the head of the site.
#>

param(
# The name of the font to include.
[string]
$FontName
)
if ($FontName) {
    "<link href='https://fonts.googleapis.com/css?family=$fontName' rel='stylesheet'>"
} else {
    @(
        "<% if site.googleFont %>"
            "<link href='https://fonts.googleapis.com/css?family={{site.googleFont}}' rel='stylesheet'>"
        "<% endif %>"
    ) -join [Environment]::Newline
}

