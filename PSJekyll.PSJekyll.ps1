# PSJekyll site self creation
$sitePath = Join-Path $PSScriptRoot 'docs'
Push-Location $sitePath
$PSJekyll.CurrentSite.Domain = "psjekyll.powershellweb.com"
$PSJekyll.CurrentSite.Data = @{LastDateBuilt = [datetime]::UtcNow.Date.ToString('yyyy-MM-dd')}
$PSJekyll.CurrentSite.Data
$PSJekyll.CurrentSite.Config = @{
    title = "PSJekyll"
    description = "A PowerShell module for creating Jekyll sites."
    baseurl = "/"
    url = "https://psjekyll.powershellweb.com"
    permalink = 'pretty'
}
$PSJekyll.CurrentSite.Config

Pop-Location