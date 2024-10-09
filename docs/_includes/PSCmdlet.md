{% for cmdletName in site.data.PSModule.CmdletNames %}
* [{{ cmdletName }}](/{{cmdletName}})
{% endfor %}