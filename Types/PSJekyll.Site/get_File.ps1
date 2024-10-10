<#
.SYNOPSIS
    Gets the files in a site.
.DESCRIPTION
    Gets the files in a Jekyll site.
.EXAMPLE
    $psJekyll.CurrentSite.File
#>
if ($this.Directory -and -not $this.'.FileList') {
    $this.psobject.properties.add([psnoteproperty]::new('.FileList', @($this.Directory.EnumerateFiles("*",'AllDirectories'))))    
}
return $this.'.FileList'
