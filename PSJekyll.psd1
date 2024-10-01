@{
    ModuleVersion ='0.1'
    Description = 'Give Jekyll more power with PowerShell'
    Guid = '793784c4-0e1f-4928-b874-1e601f9a3d29'
    RootModule = 'PSJekyll.psm1'
    TypesToProcess = @('PSJekyll.types.ps1xml')
    Author = 'James Brundage'
    CompanyName = 'PowerShellWeb'
    PrivateData = @{
        PSData = @{
            Tags = 'PowerShellWeb','Jekyll','Docker','GitHubAction'
            LicenseUri = 'https://github.com/PowerShellWeb/PSJekyll/blob/main/LICENSE'
            ProjectUri = 'https://github.com/PowerShellWeb/PSJekyll'
        }
    }
}
