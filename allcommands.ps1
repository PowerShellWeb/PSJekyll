### DO NOT EDIT THIS FILE DIRECTLY ###

#.ExternalHelp PSJekyll-Help.xml
function New-PSJekyll
{
    
    [Alias('New-Jekyll')]
    param(
    # The name of the Jekyll site
    [string]
    $Name,

    # Creates scaffolding but with empty files
    [switch]
    $Blank,

    # Force creation even if PATH already exists
    [switch]
    $Force,

    # Safe mode
    [switch]
    $Safe,

    # Skip the bundle install
    [switch]
    $SkipBundle,

    # The path to the source files
    [string]
    $SourcePath,

    # The path to the destination files
    [string]
    $DestinationPath,

    # The path to the layout files
    [string]
    $LayoutPath,

    # The path to the plugin files
    [string[]]
    $PluginPath,

    # If set,  will generate a liquid profile
    [switch]
    $LiquidProfile,

    # If set, will trace the execution
    [switch]
    $Trace
    )

    $jekyllSplat = @(
        $name
        if ($blank) { '--blank' }
        if ($force) { '--force' }
        if ($safe) { '--safe' }
        if ($skipBundle) { '--skip-bundle' }
        if ($sourcePath) {"--source $sourcePath"}
        if ($destinationPath) {"--destination $destinationPath"}
        if ($layoutPath) {"--layouts $layoutPath"}
        if ($pluginPath) {"--plugins $($pluginPath -join ',')"}
        if ($liquidProfile) {'--profile'}
        if ($trace) {'--trace'}
    )

    $newJekyllJob = jekyll new @jekyllSplat &
    $newJekyllJob.pstypenames.Insert(0,'PSJekyll.Job')
    $newJekyllJob.pstypenames.Insert(0,'PSJekyll.Job.New-PSJekyll')
    $newJekyllJob
}
 
#.ExternalHelp PSJekyll-Help.xml
function Remove-PSJekyll {    
    
    [Alias('Remove-Jekyll')]
    param(
    # The path to the file.
    [Parameter(Mandatory,Position=0,ValueFromPipelineByPropertyName)]    
    [ValidatePattern('^[\\/]')]
    [Alias('FullName')]
    [string]
    $Path
    )
    
    process {
        if (Test-Path $path) {        
            Remove-Item -Path $path         
        }
    }        
}
 
#.ExternalHelp PSJekyll-Help.xml
function Set-PSJekyll {    
    
    [Alias('Set-Jekyll')]
    param(
    # The path to the file.
    [Parameter(Mandatory,Position=0)]    
    [ValidatePattern('^[\\/]')]
    [Alias('FullName')]
    [string]
    $Path,
    
    # If set, will return the file object
    [switch]
    $PassThru,
    
    # The content to set
    [Parameter(ValueFromPipeline)]
    [object]
    $Content,

    # Any metadata to set.  
    # This will create a YAML header, which is required for most files in Jekyll to be processed properly.
    [Alias('YamlHeader')]
    [Collections.IDictionary]
    $MetaData = [Ordered]@{}
    )
    
    $allInput = @($input)
    if ((-not $allInput) -and $Content) {
        $allInput = @($Content)
    }

    if (-not $allInput) { return }
    if (-not (Test-Path $path)) {        
        New-Item -Path $path -Type File -Force | Out-Null
        if (-not $?) { return }
    }
    
    if ($path -match '\.json$') {
        if ($allInput.Length -eq 1) {         
            ConvertTo-Json -InputObject $allInput[0] -Depth $FormatEnumerationLimit | 
                Set-Content -Path $path
        } else {
            ConvertTo-Json -InputObject $allInput -Depth $FormatEnumerationLimit | 
                Set-Content -Path $path
        } 
    } 
    elseif ($path -match '\.[ct]sv$') {
        $csvSplat = [Ordered]@{Path=$path}
        if ($path -match '\.t') {
            $csvSplat.Delimiter = "`t"
        }
        $content | 
            Export-Csv @csvSplat  -NoTypeInformation 
    }
    else {
        @(
            $metadata | & $psJekyll.FormatYaml.Script -YamlHeader
            $content
        ) | 
            Set-Content -Path $path
    }
    if ($? -and $PassThru) {
        Get-Item -Path $path
    }
}
 
#.ExternalHelp PSJekyll-Help.xml
function Start-PSJekyll
{
    
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
            bundle install
                        
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
 
#.ExternalHelp PSJekyll-Help.xml
function Stop-PSJekyll {
    
    [Alias('Stop-Jekyll')]   
    param(
    # The name of the Jekyll job
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $Name = '*'
    )

    process {
        Get-Job -Name "Jekyll.$Name" | Stop-Job
    }
}