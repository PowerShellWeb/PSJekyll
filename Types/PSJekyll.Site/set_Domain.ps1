<#
.SYNOPSIS
    Sets the domain name of the site.
.DESCRIPTION
    Sets the domain name of the Jekyll site.  
    
    This will create a CNAME file in the root of the site.
#>
param([string]$cname)
$cNamePath = Join-Path $this.Directory "CNAME"
New-Item -ItemType File -Path $cNamePath -Force -Value $cname
$tryToResolveCName = try {
    [Net.Dns]::Resolve($cname)
} catch {
    Write-Warning "Could not resolve the domain name '$cname'."
}

