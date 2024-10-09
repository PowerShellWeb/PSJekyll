{% for aliasName in site.data.PSModuleAliasNames %}
{% assign pageLink = site.pages | where: "url", "/{{aliasName}}" %}
{% if pageLink %}
* [{{ aliasName }}](/{{aliasName}})
{% else %}
* {{ aliasName }}
{% endif %}
{% endfor %}