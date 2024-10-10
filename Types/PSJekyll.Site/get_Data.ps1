<#
.SYNOPSIS
    Gets data files in a Jekyll site
.DESCRIPTION
    Gets data files in a Jekyll site, using PowerShell.

    This will return the file objects in the _data folder.
#>
param()

foreach ($specialFile in $this.File -match '[\\/]_data[\\/]') {
    $specialFile.pstypenames.add("PSJekyll.DataFile")
    $specialFile
}
