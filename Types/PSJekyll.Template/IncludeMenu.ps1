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
    {% if TopLeftMenu %}
    menu .TopLeftMenu {        
        text-align: left;
        top: 0;
        left: 0;
    }
    {% endif %}
    {% if TopRightMenu %}
    menu .TopRightMenu {
        text-align: right;        
        top: 0;
        right: 0;
    }
    {% endif %}
    {% if BottomRightMenu %}
    menu .BottomRightMenu {        
        text-align: right;                
        bottom: 0;
        right: 0;
    }
    {% endif %}
    {% if TopCenterMenu %}
    menu .TopCenterMenu {        
        text-align: center;        
        top: 0;
        width: 100%;        
    }
    {% endif %}
    {% if BottomCenterMenu %}
    menu .BottomCenterMenu {        
        text-align: center;        
        bottom: 0;
        width: 100%;        
    }
    {% endif %}
    {% if LeftCenterMenu %}
    menu .LeftCenterMenu {
        text-align: left;
        vertical-align: middle;        
        left: 0;
        height: 100%;    
    }
    {% endif %}
    {% if RightCenterMenu %}
    menu .RightCenterMenu {
        text-align: right;
        vertical-align: middle;        
        right: 0;
        height: 100%;
    }
    {% endif %}
</style>
{% endif %}



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

{% if TopCenterMenu %}
<menu class='TopCenterMenu'>
    {{TopCenterMenu}}
</menu>
{% endif %}

{% if BottomLeftMenu %}
<menu class='BottomLeftMenu'>
    {{BottomLeftMenu}}
</menu>
{% endif %}

{% if BottomRightMenu %}
<menu class='BottomRightMenu'>
    {{BottomRightMenu}}
</menu>
{% endif %}

{% if BottomCenterMenu %}
<menu class='BottomCenterMenu'>
    {{BottomCenterMenu}}
</menu>
{% endif %}

{% if LeftCenterMenu %}
<menu class='LeftCenterMenu'>
    {{LeftCenterMenu}}
</menu>
{% endif %}

{% if RightCenterMenu %}
<menu class='RightCenterMenu'>
    {{RightCenterMenu}}
</menu>
{% endif %}
'@