<#
.SYNOPSIS
    Sets the 404 of the site.
.DESCRIPTION
    Sets a custom 404 of a Jekyll site.  
    
    This can be provided by a 404.html file in the root of the site.
.EXAMPLE
    $psJekyll.CurrentSite.404 = "File Not Found"
#>
param()
$this.Page = @("404.html") + $args