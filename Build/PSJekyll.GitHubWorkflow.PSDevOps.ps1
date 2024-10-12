#requires -Module PSDevOps
Import-BuildStep -SourcePath (
    Join-Path $PSScriptRoot 'GitHub'
) -BuildSystem GitHubWorkflow

Push-Location ($PSScriptRoot | Split-Path)
New-GitHubWorkflow -Name "Build PSJekyll" -On Push,
    PullRequest, 
    Demand -Job  TestPowerShellOnLinux, 
    TagReleaseAndPublish, BuildPSJekyll -Environment ([Ordered]@{
        REGISTRY = 'ghcr.io'
        IMAGE_NAME = '${{ github.repository }}'
    }) -OutputPath .\.github\workflows\BuildPSJekyll.yml

New-GitHubWorkflow -Name "Sync Issue" -On IssueOpenedOrEdited -Job SyncIssue -OutputPath .\.github\workflows\SyncIssue.yml
New-GitHubWorkflow -Name "Sync Discussion" -On Discussion -Job SyncDiscussion -OutputPath .\.github\workflows\SyncDiscussion.yml

Pop-Location