param()

foreach ($specialFile in $this.File -match '[\\/]_drafts[\\/]') {    
    $specialFile.pstypenames.add("PSJekyll.Draft.Post")
    $specialFile.pstypenames.add("PSJekyll.Post")    
    $specialFile
}
