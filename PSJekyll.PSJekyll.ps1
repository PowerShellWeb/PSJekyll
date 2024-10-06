# PSJekyll site self creation
$sitePath = Join-Path $PSScriptRoot 'docs'
Push-Location $sitePath
$PSJekyll.CurrentSite.Domain = "psjekyll.powershellweb.com"
$PSJekyll.CurrentSite.Data = @{LastDateBuilt = [datetime]::UtcNow.Date.ToString('yyyy-MM-dd')}
$PSJekyll.CurrentSite.Data
# It is important to use [Ordered], otherwise, the order of the keys will be random.
# (this will generate more changes than necessary in the git repository, and will be noisier than desired)
$PSJekyll.CurrentSite.Config = [Ordered]@{
    title = "PSJekyll"
    description = "A PowerShell module for creating Jekyll sites."    
    url = "https://psjekyll.powershellweb.com"
    permalink = 'pretty'
    palette = 'Konsolas'
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

    # Correct the case of anything named "default"
    if ($templateFileName -eq 'default') {
        $templateFileName = 'default'
    }

    if ($templateMethod.Name -notmatch '\.([^\.]+?)$') {
        $templateFileName += '.html'
    }
    $templateOut = $templateMethod.Invoke()
    $PSJekyll.CurrentSite.$templateFileType = $templateFileName, $templateOut    
}

$PSJekyll.CurrentSite.Layout
$PSJekyll.CurrentSite.Include

Pop-Location