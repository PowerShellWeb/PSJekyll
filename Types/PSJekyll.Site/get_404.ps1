<#
.SYNOPSIS
    Gets the 404 of the site.
.DESCRIPTION
    Gets a custom 404 of a Jekyll site.  
    
    This can be provided by a 404.html file in the root of the site.
.EXAMPLE
    $psJekyll.CurrentSite.404
#>
param()
$404File = Join-Path $this.Directory "404.html"
if (Test-Path $404File) {
    Get-Item -Path $404File
}