<#
.SYNOPSIS
    Creates a GitHub Pages Gemfile.
.DESCRIPTION
    Creates a Gemfile for GitHub Pages.
.EXAMPLE
    $PSJekyll.Template.'GitHubPages.Gemfile'()
#>
param()

@'
source "https://rubygems.org"
gem 'github-pages', group: :jekyll_plugins
'@
