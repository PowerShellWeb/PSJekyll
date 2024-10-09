param($AnalyticsId = 'site.analyticsId')

@"
{% if $AnalyticsId %}
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id={{$AnalyticsId}}"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', '{{$AnalyticsId}}');
</script>
{% endif %}
"@