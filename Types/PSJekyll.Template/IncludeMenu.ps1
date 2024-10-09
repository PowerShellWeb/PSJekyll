param()


@'

{% capture TopLeftMenu %}
{{page.menu.TopLeft}}
{{site.menu.TopLeft}}
{{site.data.menu.TopLeft}}
{% usless site.NoGitHubLink || site.NoLink %}
    {{include.GitHubLink}}
{% endif %}
{% endcapture %}

{% if topLeftMenu %}
<menu class='TopLeftMenu'>
    {{topLeftMenu}}
</menu>
{% endif %}
'@
