@{
    ModuleVersion ='0.1'
    Description = 'Scarily Simple Static Sites with Jekyll and PowerShell'
    Guid = '793784c4-0e1f-4928-b874-1e601f9a3d29'
    RootModule = 'PSJekyll.psm1'
    TypesToProcess = @('PSJekyll.types.ps1xml')
    FormatsToProcess = @('PSJekyll.format.ps1xml')
    Author = 'James Brundage'
    Copyright = '2024'
    CompanyName = 'PowerShellWeb'
    PrivateData = @{
        PSData = @{
            Tags = 'PowerShellWeb','Jekyll','Docker','Container','GitHubAction','StaticSite'
            LicenseUri = 'https://github.com/PowerShellWeb/PSJekyll/blob/main/LICENSE'
            ProjectUri = 'https://github.com/PowerShellWeb/PSJekyll'
            ReleaseNotes = @'
## PSJekyll 0.1

> Like It? [Star It](https://github.com/PowerShellWeb/PSJekyll)
> Love It? [Support It](https://github.com/sponsors/StartAutomating)

* Initial Release of PSJekyll
  * GitHub Action for PSJekyll
  * Docker Container for PSJekyll
  * PowerShell Module for PSJekyll

~~~PowerShell
Install-Module -Name PSJekyll -Scope CurrentUser -Force -AllowClobber
Import-Module PSJekyll -Force -PassThru | Split-Path | Push-Location
$PSJekyll.Site
~~~
'@
        }
    }
}
