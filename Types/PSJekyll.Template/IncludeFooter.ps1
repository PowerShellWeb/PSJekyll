<#
.SYNOPSIS
    Includes a footer
.DESCRIPTION
    Include for a footer.
    
    This can be included in Jekyll anytime a footer is needed.

    It is automatically included below the content of any page.
#>
param($Footer)


if ($footer) {
"<footer>$footer</footer>"
} else {
@"
<footer>
{% if page.footer %}
    {{page.footer}}
{% elsif site.footer %}
    {{site.footer}}
{% else %}
    {{include Copyright.html}}
{% endif %}
</footer>
"@
}