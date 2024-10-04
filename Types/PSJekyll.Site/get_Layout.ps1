param()

foreach ($specialFile in $this.File -match '[\\/]_layouts[\\/]') {
    $specialFile.pstypenames.add("PSJekyll.LayoutFile")
    $specialFile
}

