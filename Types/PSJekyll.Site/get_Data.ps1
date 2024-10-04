param()


[PSCustomObject]@{
    PSTypeName = 'PSJekyll.FileCollection'
    Pattern = '[\\/]_data[\\/]'
    TypeName = 'PSJekyll.DataFile'
    Directory = $this.Directory 
}
foreach ($specialFile in $this.File -match '[\\/]_data[\\/]') {
    $specialFile.pstypenames.add("PSJekyll.DataFile")
    $specialFile
}
