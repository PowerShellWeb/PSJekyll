param()

@"
{% for functionName in site.data.PSExportTypeNames %}
{% if site.pages | where: "url", "/{{functionName}}" %}
* [{{ functionName }}](/{{functionName}})
{% else %}
* {{ functionName }}
{% endif %}
{% endfor %}
"@