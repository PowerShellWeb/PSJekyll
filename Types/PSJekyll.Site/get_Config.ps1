<#
.SYNOPSIS
    Gets the config of the site.
.DESCRIPTION
    Gets the configuration of the Jekyll site.  
    
    This can be provided by a _config.yml file in the root of the site (and essentially marks it as a site)
.EXAMPLE
    $psJekyll.CurrentSite.Config
#>
param()
$configFile = Join-Path $this.Directory "_config.yml"
if (Test-Path $configFile) {
    Get-Item -Path $configFile
}