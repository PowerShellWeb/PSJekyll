<#
.SYNOPSIS
    Sets the domain name of the site.
.DESCRIPTION
    Sets the domain name of the Jekyll site.  
    
    This will create a CNAME file in the root of the site.

    This will also attempt to resolve the domain name to ensure it is valid, and will write a warning if it is not.
.EXAMPLE
    $PSJekyll.CurrentSite.Domain = 'psjekyll.powershellweb.com'
#>
param([string]$cname)
$cNamePath = Join-Path $this.Directory "CNAME"
New-Item -ItemType File -Path $cNamePath -Force -Value $cname
$tryToResolveCName = try {
    [Net.Dns]::Resolve($cname)
} catch {
    Write-Warning "Could not resolve the domain name '$cname'."
}

