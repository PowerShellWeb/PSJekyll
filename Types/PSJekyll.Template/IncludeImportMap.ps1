<#
.SYNOPSIS
    Includes an import map.
.DESCRIPTION
    Includes an import map in the site.
    
    This will add a script tag with the import map.  It should be located in the head of the site.

    If the importmap parameter is provided, it will be used.  Otherwise, the site.data.imports will be used.
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
{% if site.data.imports %}
<script type="importmap">
    {
        "imports": {
            {% for eachImport in site.data.imports %}
                "{{eachImport[0]}}": "{{eachImport[1]}}"{% unless forloop.last %},
                {% endunless %}
            {% endfor %}
        }
    }    
</script>
    
{% endif %}

'@    
}