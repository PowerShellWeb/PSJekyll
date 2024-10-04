param()

foreach ($specialFile in $this.File -match '[\\/]_includes[\\/]') {
    $specialFile.pstypenames.add("PSJekyll.IncludeFile")
    $specialFile
}

