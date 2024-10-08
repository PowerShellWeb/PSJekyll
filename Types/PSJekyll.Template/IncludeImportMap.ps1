<#
.SYNOPSIS
    Includes an import map.
.DESCRIPTION
    Includes an import map in the site.
    
    This will add a script tag with the import map.  It should be located in the head of the site.

    An importmap can be defined in the front matter of a page, in the site data, or in the site configuration.

    It may be called either `.imports` or `.importMap`.
#>
param(
$ImportMap
)

if ($ImportMap) {
"<script type='importmap'>"
[Ordered]@{
    imports = $ImportMap
} | ConvertTo-Json -Depth 3
"</script>"
} else {
@'
{% if page.imports %}
    {% assign importMap = page.imports %}
{% elsif page.importMap %}
    {% assign importMap = page.importMap %}
{% elsif site.imports %}
    {% assign importMap = site.imports %}
{% elsif site.importMap %}
    {% assign importMap = site.importMap %}
{% elseif site.data.imports %}
    {% assign importMap = site.data.imports %}
{% elseif site.data.importMap %}
    {% assign importMap = site.data.importMap %}
{% endif %}
{% if importMap %}
<script type="importmap">
{
    "imports": {
        {% for eachImport in importMap %}
            "{{eachImport[0]}}": "{{eachImport[1]}}"{% unless forloop.last %},
            {% endunless %}
        {% endfor %}
    }
}
</script>    
{% endif %}
'@    
}