# PSJekyll site self creation
$sitePath = Join-Path $PSScriptRoot 'docs'
Push-Location $sitePath
$PSJekyll.CurrentSite.Domain = "psjekyll.powershellweb.com"
$PSJekyll.CurrentSite.Data = @{LastDateBuilt = [datetime]::UtcNow.Date.ToString('yyyy-MM-dd')}
# Tracing the GitHub event that triggered the build into a data file.
$PSJekyll.CurrentSite.Data = @{GitHubEvent = $gitHubEvent}
$PSJekyll.CurrentSite.Data
# It is important to use [Ordered], otherwise, the order of the keys will be random.
# (this will generate more changes than necessary in the git repository, and will be noisier than desired)
$PSJekyll.CurrentSite.Config = [Ordered]@{
    title = "PSJekyll"
    description = "A PowerShell module for creating Jekyll sites."    
    url = "https://psjekyll.powershellweb.com"
    permalink = 'pretty'
    palette = 'Konsolas'
    analyticsId = 'G-R5C30737B2'
    googleFont = 'Noto Sans'
    stylesheet = 'https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css'
    defaults = @([Ordered]@{
        values = @{layout='Default'}
    })
}
$PSJekyll.CurrentSite.Config

foreach ($templateMethod in $PSJekyll.Template.psobject.Methods) {
    if ($templateMethod.Name -notmatch '^(?>layout|include)') {
        continue
    }
    $templateFileType = $matches.0
    
    $templateFileName = $templateMethod.Name -replace "^$templateFileType"

    if ($templateMethod.Name -notmatch '\.([^\.]+?)$') {
        $templateFileName += '.html'
    }
    $templateOut = $templateMethod.Invoke()
    $PSJekyll.CurrentSite.$templateFileType = $templateFileName, $templateOut
}

$PSJekyll.CurrentSite.Page = 'SiteMap', "{% include SiteMap.html %}"
$PSJekyll.CurrentSite.Page = 'MyRepos', "{% include MyRepos.html %}"
$PSJekyll.CurrentSite.Layout
$PSJekyll.CurrentSite.Include
$PSJekyll.CurrentSite.Page

Pop-Location