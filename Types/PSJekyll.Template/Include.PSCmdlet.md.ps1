param()

@"
{% for cmdletName in site.data.PSModuleCmdletNames %}
{% if site.pages | where: "url", "/{{cmdletName}}" %}
* [{{ cmdletName }}](/{{cmdletName}})
{% else %}
* {{ cmdletName }}
{% endif %}
{% endfor %}
"@