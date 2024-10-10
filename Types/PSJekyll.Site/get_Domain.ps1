<#
.SYNOPSIS
    Gets the domain name of the site.
.DESCRIPTION
    Gets the domain name of the Jekyll site.  
    
    This can be provided by a CNAME file in the root of the site.
.EXAMPLE
    $PSJekyll.CurrentSite.Domain
#>
$cNamePath = Join-Path $this.Directory "CNAME"
if (Test-Path $cNamePath) {
    Get-Content -Path $cNamePath
}