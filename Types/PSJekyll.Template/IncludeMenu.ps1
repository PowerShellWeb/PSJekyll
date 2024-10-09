param()


@'

{% capture TopLeftMenu %}
{{page.menu.TopLeft}}
{{site.menu.TopLeft}}
{{site.data.menu.TopLeft}}
{% unless site.NoGitHubLink or site.NoLink %}
    {{include.GitHubLink}}
{% endif %}
{% endcapture %}

{% if topLeftMenu %}
<menu class='TopLeftMenu'>
    {{topLeftMenu}}
</menu>
{% endif %}
'@
