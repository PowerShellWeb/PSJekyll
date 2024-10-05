#requires -Module HelpOut

$ModuleName = 'PSJekyll'
Push-Location ($PSScriptRoot | Split-Path)
if (-not (Get-Module $ModuleName)) {
    Import-Module .\ -Global -PassThru | Out-Host
}
# The HelpOut action does not load your module.  If you were writing your own HelpOut.ps1 file, you'd want to load the module here.

# This will save the MarkdownHelp to the docs folder, and output all of the files created.
Save-MarkdownHelp -PassThru -Module $ModuleName # -IncludeYamlHeader

# Outputting a file will check the change in (using the message of the current commit)
# If the file has a .CommitMessage property, that will be used instead.

# This will generate the MAML for the module (and output the files changed).
# MAML loads faster than inline help.
Install-MAML -Module $ModuleName -PassThru -NoComment 
Pop-Location