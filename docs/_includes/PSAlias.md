{% for aliasName in site.data.PSModuleAliasNames %}
{% if site.pages | where: "url", "/{{aliasName}}" %}
* [{{ aliasName }}](/{{aliasName}})
{% else %}
* {{ aliasName }}
{% endif %}
{% endfor %}