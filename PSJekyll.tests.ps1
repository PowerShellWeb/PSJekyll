describe PSJekyll {
    beforeAll {
        $jekyllInPath =  $ExecutionContext.SessionState.InvokeCommand.GetCommand('jekyll', 'Application')
        if (-not $jekyllInPath -and $env:GITHUB_WORKFLOW) {
            "::group::Installing FFMpeg" | Out-Host
            sudo apt update | Out-Host            
            sudo apt install ruby-full -y | Out-Host
            sudo gem install jekyll | Out-Host        
            "::endgroup::" | Out-Host
        }                                
    }
    context 'New-Jekyll' {
        it 'Will create a jekyll site' {
            $siteName = "MyRandomSite$(Get-Random)"
            $creatingSite = New-PSJekyll -Name $siteName
            if ($creatingSite -is [Management.Automation.Job]) {
                $creatingSite | Wait-Job
                $creatingSite = $creatingSite | Receive-Job
            }
            Push-Location $siteName
            $PSJekyll.CurrentSite.SiteName | Should -Be $siteName
            Pop-Location
            Remove-Item -Recurse -Force $siteName
        }
    }
}
