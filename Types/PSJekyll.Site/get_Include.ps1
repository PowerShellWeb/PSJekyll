<#
.SYNOPSIS
    Gets the include files of a site.
.DESCRIPTION
    Gets the include files in a Jekyll site.

    Include files are used to include content inline in a page.
.LINK
    https://jekyllrb.com/docs/includes/
#>

param()

foreach ($specialFile in $this.File -match '[\\/]_includes[\\/]') {
    $specialFile.pstypenames.add("PSJekyll.IncludeFile")
    $specialFile
}

