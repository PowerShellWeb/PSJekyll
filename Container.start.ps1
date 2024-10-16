<#
.SYNOPSIS
    Starts the container.
.DESCRIPTION
    Starts a container.

    This script should be called from the Dockerfile as the ENTRYPOINT (or from within the ENTRYPOINT).

    It should be deployed to the root of the container image.

    ~~~Dockerfile
    # Thank you Microsoft!  Thank you PowerShell!  Thank you Docker!
    FROM mcr.microsoft.com/powershell
    # Set the shell to PowerShell (thanks again, Docker!)
    SHELL ["/bin/pwsh", "-nologo", "-command"]
    # Run the initialization script.  This will do all remaining initialization in a single layer.
    RUN --mount=type=bind,src=./,target=/Initialize ./Initialize/Container.init.ps1

    ENTRYPOINT ["pwsh", "-nologo", "-file", "/Container.start.ps1"]
    ~~~
.NOTES
    Did you know that in PowerShell you can 'use' namespaces that do not really exist?
    This seems like a nice way to describe a relationship to a container image.
    That is why this file is using the namespace 'mcr.microsoft.com/powershell'.
    (this does nothing, but most likely will be used in the future)
#>
using namespace 'ghcr.io/powershellweb/psjekyll'

param()

$env:IN_CONTAINER = $true
$PSStyle.OutputRendering = 'Ansi'

$mountedFolders = @(if (Test-Path '/proc/mounts') {
    (Select-String "\S+\s(?<p>\S+).+rw?,.+symlinkroot=/mnt/host" "/proc/mounts").Matches.Groups |
        Where-Object Name -eq p |
        Get-Item -path { $_.Value }
})
   
if ($mountedFolders) {
    "Mounted $($mountedFolders.Length) folders:" | Out-Host
    $mountedFolders | Out-Host
}

if ($args) {
    # If there are arguments, output them (you could handle them in a more complex way).
    "$args" | Out-Host
    $global:ContainerStartArguments = @() + $args

    #region Custom
    foreach ($arg in $args) {
        $argAsUri = $arg -as [uri]
        if ($argAsUri -and $argAsUri.LocalPath -match '\.git' -or $argAsUri.DnsSafeHost -eq 'github.com') {
            $branchName = ''
            $repoUrl = 
                if ($argAsUri.DnsSafeHost -eq 'github.com') {
                    # If there were only two segments, then it is a repo.
                    if ($argAsUri.Segments -eq 3) {
                        "$arg"
                    } elseif ($argAsUri.Segments -match 'tree/$' -and $argAsUri.Segments.Length -ge 4) {
                        $branchName = $argAsUri.Segments[4..$($argAsUri.Segments.Length - 1)] -join ''
                        "https://github.com$($argAsUri.Segments[0..2] -join '')"
                    }
                } else {
                    $arg
                }
            $clonedRepo = 
                if ($branchName) {
                    git clone --branch $branchName $repoUrl
                } else {
                    git clone $repoUrl
                }
            
            $clonedRepo | Push-Location
            $foundConfigYaml = Get-ChildItem -Path $pwd -filter "_config.yml" -Recurse | 
                Select-Object -First 1 
            if ($foundConfigYaml) {
                $foundConfigYaml | 
                    Split-Path | 
                    Push-Location   
            }
            $jekyllJob = Start-PSJekyll
            while ($jekyllJob.State -notin 'Completed','Failed') {                
                Start-Sleep -Milliseconds (Get-Random -Min 1000 -Max 10000)
                $jekyllJob | Receive-Job | Out-Host
            }            
        }
    }
    #endregion Custom
} else {
    # If there are no arguments, see if there is a Microservice.ps1
    if (Test-Path './Microservice.ps1') {
        # If there is a Microservice.ps1, run it.
        . ./Microservice.ps1
    }
    #region Custom
    else 
    {
        # If a single drive is mounted, start the Jekyll server.
        if ($mountedFolders.Length -eq 1) {
            Push-Location $mountedFolders[0].Fullname            
            Start-PSJekyll
        } elseif ($psJekyll.CurrentSite) {           
            Push-Location $psJekyll.CurrentSite.Directory.FullName
            Start-PSJekyll
        }
    }
    #endregion Custom
}

# If you want to do something when the container is stopped, you can register an event.
# This can call a script that does some cleanup, or sends a message as the service is exiting.
Register-EngineEvent -SourceIdentifier PowerShell.Exiting -Action {
    if (Test-Path '/Container.stop.ps1') {
        & /Container.stop.ps1 
    }    
} | Out-Null