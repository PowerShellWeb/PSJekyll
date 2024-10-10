{% for release in site.github.releases %}
# [{{ release.tag_name }}]({{ release.html_url }})
{{ release.body }}
{% endfor %}