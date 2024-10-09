<#
.SYNOPSIS
    Gets the current site.
.DESCRIPTION
    Gets one or more current Jekyll sites.
    
    The current site is any directory containing a _config.yml.  
    
    If no directory is found, it will consider the the current directory to be the site.
.EXAMPLE
    $psJekyll.CurrentSite
#>
param(
$this = $PSJekyll
)

$jekyllConfigFiles = Get-ChildItem -Path $pwd -Recurse -Filter _config.yml
if (-not $jekyllConfigFiles) {
    $currentFolder = Get-Item $pwd
    [PSCustomObject]@{
        PSTypeName = 'PSJekyll.Site'
        Directory = $currentFolder
        SiteName = $currentFolder.Name
    }
}

foreach ($jekyllConfigFile in $jekyllConfigFiles) {
    [PSCustomObject]@{
        PSTypeName = 'PSJekyll.Site'
        Directory = $jekyllConfigFile.Directory
        SiteName = $jekyllConfigFile.Directory.Name
    }
}