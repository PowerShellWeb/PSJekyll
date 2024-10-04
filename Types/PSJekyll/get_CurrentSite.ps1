param(
$this = $PSJekyll
)

$jekyllConfigFiles = Get-ChildItem -Path $pwd -Recurse -Filter _config.yml
foreach ($jekyllConfigFile in $jekyllConfigFiles) {
    [PSCustomObject]@{
        PSTypeName = 'PSJekyll.Site'
        Directory = $jekyllConfigFile.Directory
        SiteName = $jekyllConfigFile.Directory.Name
    }
}




