function New-PSJekyll
{
    <#
    .SYNOPSIS
        Creates a new Jekyll site.
    .DESCRIPTION
        Creates a new Jekyll site, using PowerShell.
    .LINK
        https://jekyllrb.com/
    #>
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
