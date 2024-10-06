
@"
<!DOCTYPE html>
<html lang="{{ site.lang | default: "en" }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    {% include GoogleAnalytics.html %}
    {% include ImportMap.html %}
    {% include OpenGraph.html %}
    {% include GoogleFont.html %}
    {% include 4bitcss.html %}
    {% include Margin.html %}
</head>
<body>
{{content}}
</body>
"@