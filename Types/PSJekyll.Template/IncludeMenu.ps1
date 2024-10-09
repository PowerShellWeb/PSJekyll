param()


@'
{% capture TopLeftMenu %}

{{page.menu.TopLeft}}
{{site.menu.TopLeft}}
{{site.data.menu.TopLeft}}

{% endcapture %}

{% capture TopRightMenu %}
{{page.menu.TopRight}}
{{site.menu.TopRight}}
{{site.data.menu.TopRight}}
{% unless site.NoGitHubLink or site.NoLink %}
    {{include.GitHubLink}}
{% endunless %}
{% capture TopRightMenu %}

{% if TopLeftMenu %}
<menu class='TopLeftMenu'>
    {{TopLeftMenu}}
</menu>
{% endif %}

{% if TopRightMenu %}
<menu class='TopRightMenu'>
    {{TopRightMenu}}
</menu>
{% endif %}
'@
