param()

foreach ($specialFile in $this.File -match '[\\/]_posts[\\/]') {    
    $specialFile.pstypenames.add("PSJekyll.Published.Post")
    $specialFile.pstypenames.add("PSJekyll.Post")    
    $specialFile
}
