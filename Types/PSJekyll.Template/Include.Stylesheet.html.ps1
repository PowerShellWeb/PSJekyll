<#
.SYNOPSIS
    Includes stylesheets in a Jekyll site.
.DESCRIPTION
    Optionally includes stylesheets in a Jekyll site.
    
    If the site or page has any `.stylesheet` property, then the stylesheets will be included.
#>
param()

@'
{% if site.data.stylesheet %}
    {% for stylesheet in site.data.stylesheet %}
        <link rel="stylesheet" type="text/css" href="{{ stylesheet }}" />
    {% endfor %}
{% endif %}
{% if page.stylesheet %}
    {% for stylesheet in page.stylesheet %}
        <link rel="stylesheet" type="text/css" href="{{ stylesheet }}" />
    {% endfor %}
{% endif %}
{% if include.stylesheet %}
    {% for stylesheet in include.stylesheet %}
        <link rel="stylesheet" type="text/css" href="{{ stylesheet }}" />
    {% endfor %}
{% endif %}
'@