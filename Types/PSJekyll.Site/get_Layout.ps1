<#
.SYNOPSIS
    Gets the layout files of a site.
.DESCRIPTION
    Gets the layout files in a Jekyll site.

    Layout files are used to define the structure of a page.
.LINK
    https://jekyllrb.com/docs/layouts/
#>
param()

foreach ($specialFile in $this.File -match '[\\/]_layouts[\\/]') {
    $specialFile.pstypenames.add("PSJekyll.LayoutFile")
    $specialFile
}

