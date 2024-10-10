#requires -Module PSDevOps
Import-BuildStep -SourcePath (
    Join-Path $PSScriptRoot 'GitHub'
) -BuildSystem GitHubAction

$PSScriptRoot | Split-Path | Push-Location

New-GitHubAction -Name "PublishPSJekyll" -Description 'Publish with PSJekyll' -Action PSJekyllAction -Icon chevron-right -OutputPath .\action.yml

Pop-Location