#requires -Module HelpOut

#region Load the Module
$ModuleName = 'PSJekyll'
Push-Location ($PSScriptRoot | Split-Path)
if (-not (Get-Module $ModuleName)) {
    Import-Module .\ -Global -PassThru | Out-Host
}
#endregion Load the Module

# This will save the MarkdownHelp to the docs folder, and output all of the files created.
Save-MarkdownHelp -PassThru -Module $ModuleName -ExcludeCommandType Alias

Pop-Location