# PSJekyll site self creation
$sitePath = Join-Path $PSScriptRoot 'docs'
Push-Location $sitePath
$PSJekyll.CurrentSite2.Domain = "psjekyll.powershellweb.com" # this should error, but not fail
$PSJekyll.CurrentSite.Data = @{LastDateBuilt = [datetime]::UtcNow.Date.ToString('yyyy-MM-dd')}
throw "Testing throw" # this should fail the build
$PSJekyll.CurrentSite.Data
$PSJekyll.CurrentSite.Config = @{
    title = "PSJekyll"
    description = "A PowerShell module for creating Jekyll sites."
    baseurl = "/"
    url = "https://psjekyll.powershellweb.com"    
}
$PSJekyll.CurrentSite.Config

Pop-Location