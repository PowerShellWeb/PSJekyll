<#
.SYNOPSIS
    Includes a Google Font.
.DESCRIPTION
    Includes a Google Font in the site.
    
    This will add a link to the Google Font.
    
    It can be located within the site or page front matter.
#>

param(
# The name of the font to include.
# If no value is directly provided, it will attempt to find a value in site.googleFont.
# If no font is found, it will default to Roboto.
[string]
$FontName,

# The code font to include.
# If no code font is provided, it will default to Roboto Mono.
[string]
$CodeFont
)
@(
if ($FontName) {
    "<link href='https://fonts.googleapis.com/css?family=$fontName' rel='stylesheet'>"
} else {    
    "{% if page.googleFont %}"
        "<link href='https://fonts.googleapis.com/css?family={{page.googleFont}}' rel='stylesheet'>"
        "<style type='text/css'>body { font-family: '{{page.googleFont}}',sans-serif } </style>"
    "{% elsif site.googleFont %}"
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
        "{% if page.codeFont %}"
            "<link href='https://fonts.googleapis.com/css?family={{page.codeFont}}' rel='stylesheet'>"
            "<style type='text/css'>code, pre { font-family: '{{page.codeFont}}',monospace } </style>"
        "{% elsif site.codeFont %}"
            "<link href='https://fonts.googleapis.com/css?family={{site.codeFont}}' rel='stylesheet'>"
            "<style type='text/css'>code, pre { font-family: '{{site.codeFont}}',monospace } </style>"
        "{% else %}"
            "<link href='https://fonts.googleapis.com/css?family=Roboto+Mono' rel='stylesheet'>"
            "<style type='text/css'>code, pre { font-family: 'Roboto Mono',monospace } </style>"
        "{% endif %}"
}
) -join [Environment]::Newline

