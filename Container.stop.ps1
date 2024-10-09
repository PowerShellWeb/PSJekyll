<#
.SYNOPSIS
    Stops the container.
.DESCRIPTION
    This script is called when the container is about to stop.

    It can be used to perform any necessary cleanup before the container is stopped.
#>
"Container now exiting, thank you for using PSJekyll!" | Out-Host
Get-Process ruby | Stop-Process
