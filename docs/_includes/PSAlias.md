| Alias | Command |
|:-|-:|{% for alias in site.data.PSModule.Aliases %}
|{{ alias.Name }}|[{{ alias.Definition }}](/{{alias.Definition}})|
{% endfor %}