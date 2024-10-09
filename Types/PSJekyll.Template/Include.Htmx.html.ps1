<#
.SYNOPSIS
    Includes the htmx library.
.DESCRIPTION
    Optionally includes the htmx library in a Jekyll site.

    If the site or page has any `.htmx` property, then the htmx library will be included.
#>
param()

@'
{% if page.htmx or site.htmx %}
<script src='https://unpkg.com/htmx.org@latest'></script>
{% endif %}
'@