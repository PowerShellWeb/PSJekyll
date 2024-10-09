param()

@"
{% for typeName in site.data.PSModule.TypeNames %}
* [{{ typeName }}](/{{typeName}})
{% endfor %}
"@