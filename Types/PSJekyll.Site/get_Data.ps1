param()

foreach ($specialFile in $this.File -match '[\\/]_data[\\/]') {
    $specialFile.pstypenames.add("PSJekyll.DataFile")
    $specialFile
}
