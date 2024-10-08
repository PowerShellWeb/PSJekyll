<#
.SYNOPSIS
    Includes a copyright notice
.DESCRIPTION
    Include for a copyright notice.
    
    This can be included in Jekyll anytime a copyright notice is needed.
#>
param(
# A custom copyright notice.
[string]
$Copyright
)

if ($Copyright) {
    return $Copyright
} else {
@"
&copy; {% if page.copyright %}
    {{page.copyright}}
{% elsif site.copyright %}
    {{site.copyright}}
{% elsif site.data.PSModuleInfo.Copyright %}
    {{site.data.PSModuleInfo.Copyright}}
{% else %}
    {{ site.time | date: '%Y' }} {{ site.author }}
{% endif %}
"@
}