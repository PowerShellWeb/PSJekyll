<#
.SYNOPSIS
    Gets drafts in a Jekyll site.    
.DESCRIPTION
    Gets drafts in a Jekyll site, using PowerShell.

    This will return the file objects in the `_drafts` folder.
#>
param()

foreach ($specialFile in $this.File -match '[\\/]_drafts[\\/]') {    
    $specialFile.pstypenames.add("PSJekyll.Draft.Post")
    $specialFile.pstypenames.add("PSJekyll.Post")    
    $specialFile
}
