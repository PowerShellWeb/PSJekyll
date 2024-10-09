param()

@"
{% for functionName in site.data.PSModuleFunctionNames %}
{% if site.pages | where: "url", "/{{functionName}}" %}
* [{{ functionName }}](/{{functionName}})
{% else %}
* {{ functionName }}
{% endif %}
{% endfor %}
"@