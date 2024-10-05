$myGitDirectory = Join-Path $PSScriptRoot .git
if (Test-Path $myGitDirectory) {
    $commandsPath = Join-Path $PSScriptRoot .\Commands
    [include('*-*')]$commandsPath
} else {
    . (Join-Path $PSScriptRoot "allcommands.ps1")
}


$myModule = $MyInvocation.MyCommand.ScriptBlock.Module
$ExecutionContext.SessionState.PSVariable.Set($myModule.Name, $myModule)
$myModule.pstypenames.insert(0, $myModule.Name)

New-PSDrive -Name $MyModule.Name -PSProvider FileSystem -Scope Global -Root $PSScriptRoot -ErrorAction Ignore

if ($home) {
    $MyModuleProfileDirectory = Join-Path ([Environment]::GetFolderPath("LocalApplicationData")) $MyModule.Name
    if (-not (Test-Path $MyModuleProfileDirectory)) {
        $null = New-Item -ItemType Directory -Path $MyModuleProfileDirectory -Force
    }
    New-PSDrive -Name "My$($MyModule.Name)" -PSProvider FileSystem -Scope Global -Root $MyModuleProfileDirectory -ErrorAction Ignore
}

$KnownVerbs = Get-Verb | Select-Object -ExpandProperty Verb

# Set a script variable of this, set to the module
# (so all scripts in this scope default to the correct `$this`)
$script:this = $myModule

Export-ModuleMember -Alias * -Function * -Variable $myModule.Name

$script:ModuleApp = $ExecutionContext.SessionState.InvokeCommand.GetCommand('jekyll','Application')
if (-not $script:ModuleApp) {
    Write-Warning "jekyll is not installed, or not in the path.  Please install"
    return
}
