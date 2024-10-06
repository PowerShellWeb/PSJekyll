# PSJekyll site self creation
$sitePath = Join-Path $PSScriptRoot 'docs'
Push-Location $sitePath
$PSJekyll.CurrentSite.Domain = "psjekyll.powershellweb.com"
$PSJekyll.CurrentSite.Data = @{LastDateBuilt = [datetime]::UtcNow.Date.ToString('yyyy-MM-dd')}
$PSJekyll.CurrentSite.Data
Pop-Location