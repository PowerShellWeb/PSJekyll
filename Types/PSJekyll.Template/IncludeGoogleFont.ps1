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
$FontName,

[string]
$CodeFont
)
@(
if ($FontName) {
    "<link href='https://fonts.googleapis.com/css?family=$fontName' rel='stylesheet'>"
} else {    
    "{% if site.googleFont %}"
        "<link href='https://fonts.googleapis.com/css?family={{site.googleFont}}' rel='stylesheet'>"
        "<style type='text/css'>body { font-family: '{{site.googleFont}}',sans-serif } </style>"
    "{% else %}"
        "<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>"
        "<style type='text/css'>body { font-family: 'Roboto',sans-serif } </style>"
    "{% endif %}"    
}

if ($CodeFont) {
    "<link href='https://fonts.googleapis.com/css?family=$CodeFont' rel='stylesheet'>"
} else {    
        "{% if site.codeFont %}"
            "<link href='https://fonts.googleapis.com/css?family={{site.codeFont}}' rel='stylesheet'>"
            "<style type='text/css'>code, pre { font-family: '{{site.codeFont}}',monospace } </style>"
        "{% else %}"
            "<link href='https://fonts.googleapis.com/css?family=Roboto+Mono' rel='stylesheet'>"
            "<style type='text/css'>code, pre { font-family: 'Roboto Mono',monospace } </style>"
        "{% endif %}"
}
) -join [Environment]::Newline

