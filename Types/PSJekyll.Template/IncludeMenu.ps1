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
    {{include GitHubLink}}
{% endunless %}
{% endcapture %}

{% capture TopCenterMenu %}
{{page.menu.TopCenter}}
{{site.menu.TopCenter}}
{{site.data.menu.TopCenter}}
{% endcapture %}

{% capture BottomLeftMenu %}
{{page.menu.BottomLeft}}
{{site.menu.BottomLeft}}
{{site.data.menu.BottomLeft}}
{% endcapture %}

{% capture BottomRightMenu %}
{{page.menu.BottomRight}}
{{site.menu.BottomRight}}
{{site.data.menu.BottomRight}}
{% endcapture %}

{% capture BottomCenterMenu %}
{{page.menu.BottomCenter}}
{{site.menu.BottomCenter}}
{{site.data.menu.BottomCenter}}
{% endcapture %}

{% capture LeftCenterMenu %}
{{page.menu.LeftCenter}}
{{site.menu.LeftCenter}}
{{site.data.menu.LeftCenter}}
{% endcapture %}

{% capture RightCenterMenu %}
{{page.menu.RightCenter}}
{{site.menu.RightCenter}}
{{site.data.menu.RightCenter}}
{% endcapture %}

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
</style>
{% endif %}

{% if TopLeftMenu | strip %}
<menu class='Top Left'>
    {{TopLeftMenu}}
</menu>
{% endif %}

{% if TopRightMenu | strip %}
<menu class='Top Right'>
    {{TopRightMenu}}
</menu>
{% endif %}

{% if TopCenterMenu | strip %}
<menu class='Top Center'>
    {{TopCenterMenu}}
</menu>
{% endif %}

{% if BottomLeftMenu | strip %}
<menu class='Bottom Left'>
    {{BottomLeftMenu}}
</menu>
{% endif %}

{% if BottomRightMenu | strip %}
<menu class='Bottom Right'>
    {{BottomRightMenu}}
</menu>
{% endif %}

{% if BottomCenterMenu | strip %}
<menu class='Bottom Center'>
    {{BottomCenterMenu}}
</menu>
{% endif %}

{% if LeftCenterMenu | strip %}
<menu class='Left Center'>
    {{LeftCenterMenu}}
</menu>
{% endif %}

{% if RightCenterMenu | strip %}
<menu class='Right Center'>
    {{RightCenterMenu}}
</menu>
{% endif %}
'@
