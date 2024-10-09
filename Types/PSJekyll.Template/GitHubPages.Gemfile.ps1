<#
.SYNOPSIS
    Creates a GitHub Pages Gemfile.
.DESCRIPTION
    Creates a Gemfile for GitHub Pages.
#>
param()

@'
source "https://rubygems.org"
gem 'github-pages', group: :jekyll_plugins
'@
