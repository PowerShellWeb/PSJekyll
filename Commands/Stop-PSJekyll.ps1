function Stop-PSJekyll {
    <#
    .SYNOPSIS
        Stops a Jekyll server
    .DESCRIPTION
        Stops a Jekyll server in a PowerShell job.
    .LINK
        https://jekyllrb.com/
    #>
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