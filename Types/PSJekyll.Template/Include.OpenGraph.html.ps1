<#
.SYNOPSIS
    Include Open Graph meta tags in a Jekyll site.
.DESCRIPTION
    Include Open Graph meta tags in a Jekyll site.

    These tags can help social media sites understand the content of your site, and show preview images.

    This script is intended to be included in the head of a Jekyll site.

    It will output the Open Graph meta tags for the current page and site.
.NOTES
    Tags included:
    - og:site_name
    - og:title
    - og:type
    - og:description
    - og:url
    - og:image
    - article:published_time
#>
param()

@'
<meta content="{{ site.title }}" property="og:site_name" />
{% if page.title %}
<meta content="{{ page.title }}" property="og:title" />
{% else %}
<meta content="{{ site.title }}" property="og:title" />
{% endif %}
{% if page.type %}
<meta content="{{ page.type }}" property="og:type" />
{% else %}
<meta content="website" property="og:type" />
{% endif %}
{% if page.description %}
<meta content="{{ page.description }}" property="og:description" />
<meta name="description" content="{{ page.description }}" />
<meta name="twitter:description" content="{{ page.description }}" />
{% elsif content %}

<meta property="og:description" content="{{ content | strip_html | truncatewords: 20 }}" />
<meta name="description" content="{{ content | strip_html | truncatewords: 20 }}" />
<meta name="twitter:description" content="{{ content | strip_html | truncatewords: 20 }}" />

{% elsif site.description %}
<meta content="{{ site.description }}" property="og:description" />
<meta name="description" content="{{ site.description }}" />
<meta name="twitter:description" content="{{ site.description }}" />
{% endif %}
{% if page.date %}
    <meta content="{{ page.date | date_to_xmlschema }}" property="article:published_time" />
{% endif %}
{% if page.url %}
    <meta content="{{ site.url }}{{ page.url }}" property="og:url" />
    <meta name="twitter:url" content="{{ site.url }}{{ page.url }}" />
    <meta name="twitter:domain" content="{{ site.url }}" />
{% endif %}

{% if page.image %}
    <meta content="/{{ page.image }}" property="og:image" />
    <meta name="twitter:image" content="{{ site.url }}/{{ page.image }}" />
    <meta name="twitter:image:src" content="{{ site.url }}/{{ page.image }}"  />
{% elsif site.image %}
    <meta content="{{ site.url }}/{{ site.image }}" property="og:image" />
    <meta name="twitter:image" content="{{ site.url }}/{{ site.image }}" />
    <meta name="twitter:image:src" content="{{ site.url }}/{{ site.image }}" />
{% endif %}
'@

