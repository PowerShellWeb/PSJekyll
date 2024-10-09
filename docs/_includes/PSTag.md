{% for tagName in site.data.PSModuleInfo.Tags %}
* [{{ tagName }}](https://www.powershellgallery.com/packages?q=Tags%3A%22{{tagName}}%22)
{% endfor %}