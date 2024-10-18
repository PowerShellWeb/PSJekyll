param(
# The issue state.  Can be open, closed, or all
[ValidateSet('open','closed','all')]
[string]
$IssueState = $(if ($env:IssueState) { $env:IssueState } else { 'all' }),

# The issue label.
[string[]]
$IssueLabel = $(if ($env:IssueLabel) { $env:IssueLabel } else { @() }),
)

if (-not $gitHubEvent.issue -and -not $gitHubEvent.discussion) {
    Write-Warning "GitHub Event is not an issue or discussion, will not sync"
}

if ($env:GitHubToken) {
    "GitHub Token is present" | Out-Host
}
if ($GitHubToken -and $env:GITHUB_REPOSIORY) {
    $owner, $repo = $env:GITHUB_REPOSIORY -split '/'
    "Getting issues for $owner, $repo" | Out-Host
    $queryString = @(
        if ($IssueState) {
            "state=$($issueState.ToLower())"
        }
        if ($IssueLabel) {
            "labels=$($IssueLabel -join ',')"
        }
        'per_page=100'
    ) -join '&'
    $issues = 
        Invoke-RestMethod -Uri "https://api.github.com/repos/$owner/$repo/issues?$queryString" -Headers @{
            "Authorization" = "token $GitHubToken"
        }
    foreach ($issue in $issues) {
        $psJekyll.CurrentSite.Data = @{"issues/$($issue.number)" = $issue}
    }
} else {
    if ($gitHubEvent.issue) {
        $psJekyll.CurrentSite.Data = @{"issues/$($gitHubEvent.issue.number)" = $gitHubEvent.issue}
    } 
    if ($gitHubEvent.discussion) {
        $psJekyll.CurrentSite.Data = @{"discussions/$($gitHubEvent.discussion.number)" = $gitHubEvent.discussion}
    }
}

$psJekyll.CurrentSite.Data


