param()


@'
{% capture TopLeftMenu %}

{{page.menu.TopLeft}}
{{site.menu.TopLeft}}
{{site.data.menu.TopLeft}}

{% endcapture %}
{% assign TopLeftMenu = TopLeftMenu | strip %}}

{% capture TopRightMenu %}
    {{page.menu.TopRight}}
    {{site.menu.TopRight}}
    {{site.data.menu.TopRight}}
    {% unless site.NoGitHubLink or site.NoLink %}
        {% include GitHubLink.html %}
    {% endunless %}
{% endcapture %}
{% assign TopRightMenu = TopRightMenu | strip %}

{% capture TopCenterMenu %}
    {{page.menu.TopCenter}}
    {{site.menu.TopCenter}}
    {{site.data.menu.TopCenter}}
{% endcapture %}
{% assign TopCenterMenu = TopCenterMenu | strip %}

{% capture BottomLeftMenu %}
{{page.menu.BottomLeft}}
{{site.menu.BottomLeft}}
{{site.data.menu.BottomLeft}}
{% endcapture %}
{% assign BottomLeftMenu = BottomLeftMenu | strip %}

{% capture BottomRightMenu %}
{{page.menu.BottomRight}}
{{site.menu.BottomRight}}
{{site.data.menu.BottomRight}}
{% endcapture %}
{% assign BottomRightMenu = BottomRightMenu | strip %}

{% capture BottomCenterMenu %}
{{page.menu.BottomCenter}}
{{site.menu.BottomCenter}}
{{site.data.menu.BottomCenter}}
{% endcapture %}
{% assign BottomCenterMenu = BottomCenterMenu | strip %}

{% capture LeftCenterMenu %}
{{page.menu.LeftCenter}}
{{site.menu.LeftCenter}}
{{site.data.menu.LeftCenter}}
{% endcapture %}
{% assign LeftCenterMenu = LeftCenterMenu | strip %}

{% capture RightCenterMenu %}
{{page.menu.RightCenter}}
{{site.menu.RightCenter}}
{{site.data.menu.RightCenter}}
{% endcapture %}
{% assign RightCenterMenu = RightCenterMenu | strip %}

{% if TopLeftMenu or TopRightMenu or TopCenterMenu or BottomLeftMenu or BottomRightMenu or BottomCenterMenu or LeftCenterMenu or RightCenterMenu %}
<style>
    /* Menu Styles */
    menu {
        z-index: 100;
        position: fixed;
        display: float;
        margin: 1em;
    }
    menu[class~=Left] {
        left: 0;
        text-align: left;
    }
    menu[class~=Right] {
        right: 0;
        text-align: right;
    }
    menu[class~=Top] {
        top: 0;        
    }
    menu[class~=Bottom] {
        bottom: 0;        
    }
    menu[class~=Center] {
        text-align: center;
    }
    .Top .Center {
        width: 100%;
    }
    .Left .Center {
        height: 100%;
    }
    .Right .Center {
        height: 100%;
    }
    .Bottom .Center {
        width: 100%;
    }
</style>
{% endif %}

{% if TopLeftMenu %}
<menu class='Top Left'>
    {{TopLeftMenu}}
</menu>
{% endif %}

{% if TopRightMenu %}
<menu class='Top Right'>
    {{TopRightMenu}}
</menu>
{% endif %}

{% if TopCenterMenu %}
<menu class='Top Center'>
    {{TopCenterMenu}}
</menu>
{% endif %}

{% if BottomLeftMenu %}
<menu class='Bottom Left'>
    {{BottomLeftMenu}}
</menu>
{% endif %}

{% if BottomRightMenu %}
<menu class='Bottom Right'>
    {{BottomRightMenu}}
</menu>
{% endif %}

{% if BottomCenterMenu %}
<menu class='Bottom Center'>
    {{BottomCenterMenu}}
</menu>
{% endif %}

{% if LeftCenterMenu %}
<menu class='Left Center'>
    {{LeftCenterMenu}}
</menu>
{% endif %}

{% if RightCenterMenu %}
<menu class='Right Center'>
    {{RightCenterMenu}}
</menu>
{% endif %}
'@
