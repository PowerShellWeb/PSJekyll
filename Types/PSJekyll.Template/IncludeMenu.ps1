param()


@'

{% capture TopLeftMenu %}
{% if page.menu.TopLeft %}
    {{page.menu.TopLeft}}
{% elsif site.menu.TopLeft %}
    {{site.menu.TopLeft}}
{% elsif site.data.menu.TopLeft %}
    {{site.data.menu.TopLeft}}
{% else %}
    {{include.GitHubLink}}
{% endif %}
{% endcapture %}

{% if topLeftMenu %}
<menu class='TopLeftMenu'>
    {{topLeftMenu}}
</menu>
{% endif %}
'@
