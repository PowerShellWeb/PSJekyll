if ($this.Directory -and -not $this.'.FileList') {
    $this.psobject.properties.add([psnoteproperty]::new('.FileList', @($this.Directory.EnumerateFiles("*",'AllDirectories'))))    
}
return $this.'.FileList'
