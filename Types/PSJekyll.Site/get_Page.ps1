foreach ($specialFile in $this.File -notmatch '[\\/]_.+?[\\/]' -match '(?>\.md|\.markdown|.\html)$') {
    $specialFile.pstypenames.add("PSJekyll.Page")    
    $specialFile
}