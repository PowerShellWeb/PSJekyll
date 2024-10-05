describe PSJekyll {
    context 'New-Jekyll' {
        it 'Will create a jekyll site' {
            $siteName = "MyRandomSite$(Get-Random)"
            $creatingSite = New-PSJekyll -Name $siteName
            Push-Location $siteName
            $PSJekyll.CurrentSite.SiteName | Should -Be $siteName
            Pop-Location
            Remove-Item -Recurse -Force $siteName
        }
    }
}
