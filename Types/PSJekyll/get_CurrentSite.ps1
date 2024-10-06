param(
$this = $PSJekyll
)

$jekyllConfigFiles = Get-ChildItem -Path $pwd -Recurse -Filter _config.yml
if (-not $jekyllConfigFiles) {
    $currentFolder = Get-Item $pwd
    [PSCustomObject]@{
        PSTypeName = 'PSJekyll.Site'
        Directory = $currentFolder
        SiteName = $currentFolder.Name
    }
}

foreach ($jekyllConfigFile in $jekyllConfigFiles) {
    [PSCustomObject]@{
        PSTypeName = 'PSJekyll.Site'
        Directory = $jekyllConfigFile.Directory
        SiteName = $jekyllConfigFile.Directory.Name
    }
}




