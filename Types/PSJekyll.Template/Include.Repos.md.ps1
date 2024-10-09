<#
.SYNOPSIS
    Include my repositories.
.DESCRIPTION
    Include my repositories in the site.
    
    This will add a list of the owner's repositories to the site.

    This will only work in GitHub Pages.
.LINK
    https://github.com/jekyll/github-metadata/blob/main/docs/site.github.md
#>
param()

@'
{% for repository in site.github.public_repositories %}
  * [{{ repository.name }}]({{ repository.html_url }})
{% endfor %}
'@
