<#
.SYNOPSIS
    Gets the config of the site.
.DESCRIPTION
    Gets the configuration of the Jekyll site.  
    
    This can be provided by a _config.yml file in the root of the site (and essentially marks it as a site)
.EXAMPLE
    $psJekyll.CurrentSite.Config = [Ordered]@{
        title = 'My Awesome Site'
        description = 'This is a site that is awesome.'
        permalink = 'pretty'
    }
#>
param(
# The new configuration object.
# This will be converted to YAML and added to the _config.yml file.
$Value
)
$configFile = Join-Path $this.Directory "_config.yml"
$valueToAdd = 
    if ($value -is [string]) {
        $value
    } 
    elseif ($value -is [IO.FileInfo]) {
        Get-Content -Path $value.FullName
    }
    else {
        & $PSJekyll.FormatYAML.Script $value
    }

New-Item -ItemType File -Path $configFile -Force -Value $valueToAdd
