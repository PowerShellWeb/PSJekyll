<#
.SYNOPSIS
    Gets the config of the site.
.DESCRIPTION
    Gets the configuration of the Jekyll site.  
    
    This can be provided by a _config.yml file in the root of the site (and essentially marks it as a site)
#>
param(
$Value
)
$configFile = Join-Path $this.Directory "_config.yml"
$valueToAdd = 
    if ($value -is [string]) {
        $value
    } else {
        & $PSJekyll.FormatYAML.Script $value
    }
if (Test-Path $configFile) {    
    Set-Content -Path $configFile -Value $valueToAdd    
} else {
    New-Item -ItemType File -Path $configFile -Force -Value $valueToAdd
}