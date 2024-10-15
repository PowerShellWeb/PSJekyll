if (-not $gitHubEvent.issue -and -not $gitHubEvent.discussion) {
    Write-Warning "GitHub Event is not an issue or discussion, will not sync"
}

Start-Sleep -Seconds (Get-Random -Minimum 10 -Maximum 20)
get merge origin/main | Out-Host
git pull | Out-Host

if ($gitHubEvent.issue) {
    $psJekyll.CurrentSite.Data = @{"issues/$($gitHubEvent.issue.number)" = $gitHubEvent.issue}
} 
if ($gitHubEvent.discussion) {
    $psJekyll.CurrentSite.Data = @{"discussions/$($gitHubEvent.discussion.number)" = $gitHubEvent.discussion}
}

$psJekyll.CurrentSite.Data


