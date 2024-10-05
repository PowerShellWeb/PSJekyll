describe PSJekyll {
    beforeAll {
        $jekyllInPath =  $ExecutionContext.SessionState.InvokeCommand.GetCommand('jekyll', 'Application')
        if (-not $jekyllInPath -and $env:GITHUB_WORKFLOW) {
            "::group::Installing FFMpeg" | Out-Host
            sudo apt update | Out-Host            
            sudo apt install ruby-full bundler -y | Out-Host
            sudo gem install jekyll | Out-Host
            "::endgroup::" | Out-Host
        }                                
    }
    context 'New-PSJekyll' {
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

    context 'Start-PSJekyll' {
        it 'Will start a jekyll site' {
            $siteName = "MyRandomSite$(Get-Random)"
            $creatingSite = New-PSJekyll -Name $siteName
            if ($creatingSite -is [Management.Automation.Job]) {
                $creatingSite | Wait-Job
                $creatingSite = $creatingSite | Receive-Job
            }
            Push-Location $siteName
            $randomPort = (Get-Random -Min 5000 -Maximum 8000)
            Add-Content -Path "_config.yml" -Value "permalink: pretty"
            $psJekyll.CurrentSite.Data = @{"StartTime"=[DateTime]::Now}
            $psJekyll.CurrentSite.Layout = "contentOnly", "{{content}}"
            $psJekyll.CurrentSite.Page = "aPage.md", @{"title"="My Page";layout="contentOnly"}, "This is my page. It was started at {{ site.data.StartTime }}"
            $startingSite = Start-PSJekyll -Port $randomPort
            if ($startingSite -is [Management.Automation.Job]) {
                $startingSite | Wait-Job -Timeout 15
                $startingSite = $startingSite | Receive-Job
            }
            Invoke-RestMethod -Uri "http://localhost:$randomPort" | Should -Not -Be $Null
            $aPageOutput = Invoke-RestMethod -Uri "http://localhost:$randomPort/aPage"
            $aPageOutput | Should -Not -Be $null
            if ($aPageOutput.OuterXml) {
                $aPageOutput.OuterXml | Should -Match "$([DateTime]::now.ToString('yyyy-MM-dd'))"
            }            
            Pop-Location
            Get-Job | Stop-PSJekyll
            Get-Job | Remove-Job
            Remove-Item -Recurse -Force $siteName            
        }
    }
}
