describe PSJekyll {
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
