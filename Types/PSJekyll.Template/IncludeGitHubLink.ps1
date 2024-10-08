<#
.SYNOPSIS
    Includes a link to a GitHub repository.
.DESCRIPTION
    Include for a link to a GitHub repository.
    
    This can be included in Jekyll anytime a link to a GitHub repository is needed.

    If no link is provided, the template will attempt to use the site's repository URL.
    (this will only work in a GitHub page)
#>
param(
[uri]
$RepositoryUrl
)

@(if ($RepositoryUrl) {
    "[GitHub]($RepositoryUrl)"
} else {
    "{% if site.github.repository_url %}"
        "[GitHub]({{site.github.repository_url}})"
    "{% endif %}"
}) -join [Environment]::Newline