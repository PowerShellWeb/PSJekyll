function Start-PSJekyll
{
    <#
    .SYNOPSIS
        Starts a Jekyll server
    .DESCRIPTION
        Starts a Jekyll server in a PowerShell job.
    .LINK
        https://jekyllrb.com/
    #>
    [Alias('Start-Jekyll')]
    [CmdletBinding()]
    param(
    # The name of the Jekyll site
    [string]
    $Name,

    # One or more config files to use
    [Alias('Configuration')]
    [string[]]
    $Config,

    # The source directory
    [string]
    $SourcePath,

    # The destination directory
    [string]
    $DestinationPath,
    
    # The host header
    [string]
    $HostHeader,

    # The port to listen on
    [uint]
    $Port,

    # The path to the plugin files
    [string[]]
    $PluginPath,

    # If set, will show a directory list.
    [switch]
    $ShowDirectoryList,

    # If set, will enable live reload.
    [switch]
    $LiveReload,

    # If set,  will generate a liquid profile
    [switch]
    $LiquidProfile,

    # If set, will trace the execution
    [switch]
    $Trace,    

    # Watch for changes and rebuild
    [switch]
    $Watch,

    # If set, will publish posts with a future date (previewing them).
    [switch]
    $PreviewFuture,

    # The base URL for the site
    [string]
    $BaseUrl,

    # If set, will detach the process
    [switch]
    $Detach,

    # Enable incremental rebuilds
    [switch]
    $Incremental
    )

    if ($env:IN_CONTAINER -and -not $HostHeader) {
        $HostHeader = '*'
    } 

    $jekyllSplat = @(                
        if ($force) { '--force' }
        if ($safe) { '--safe' }
        if ($Detach) { '--detach' }
        if ($PreviewFuture) { '--future' }
        if ($liveReload) {'--livereload'}
        if ($sourcePath) {"--source";"$sourcePath"}
        if ($destinationPath) {"--destination";"$destinationPath"}
        if ($BaseUrl) {"--baseurl";"$BaseUrl"}
        if ($Incremental) {'--incremental'}
        if ($HostHeader) {"--host"; "$HostHeader"}
        if ($Port) {"--port"; "$Port"}
        if ($ShowDirectoryList) {'--show-dir-list'}
        if ($layoutPath) {"--layouts"; "$layoutPath"}
        if ($pluginPath) {"--plugins"; "$($pluginPath -join ',')"}
        if ($liquidProfile) {'--profile'}
        if ($trace) {'--trace'}
        if ($watch) {'--watch'}

    )
        
    $startedAfter = [DateTime]::Now
    if ($jekyllSplat -notmatch '--watch') {
        $jekyllSplat += '--watch'
    }
    if ($jekyllSplat -notmatch '--incremental') {
        $jekyllSplat += '--incremental'
    }
    if ($jekyllSplat -notmatch '--trace') {
        $jekyllSplat += '--trace'
    }
    
    Write-Verbose "Starting Jekyll server $jekyllSplat"
    $jobName = if ($hostHeader) { "PSJekyll.$hostHeader" } else { "Start-PSJekyll" }
    $jekyllJob = 
        Start-ThreadJob -ScriptBlock {
            if ($ExecutionContext.SessionState.InvokeCommand.GetCommand('sudo','application')) {
                sudo bundle install
            } else {
                bundle install
            }
                        
            if ($args -match '^\*$' -and $args -match '^--host$') {
                $otherArgs = @($args -notmatch '^(?>--host|\*)$')                
                bundle exec jekyll serve --host '*' @otherArgs
            } else {
                $promptLongForm = @('exec','jekyll','serve') + $args 
                bundle @promptLongForm
            }                        
        } -ArgumentList $jekyllSplat -Name $jobName
    
    $jekyllProcesses = Get-Process *ruby* | Where-Object { $_.StartTime -ge $startedAfter }

    Register-EngineEvent -SourceIdentifier PowerShell.Exiting -Action {
        get-process ruby | Stop-Process -Force
    } | Out-Null
    
    $jekyllJob.pstypenames.insert(0,"PSJekyll.JekyllJob")
    $jekyllJob.psobject.properties.Add([psnoteproperty]::New("Processes", $jekyllProcesses))
    $jekyllJob
}
