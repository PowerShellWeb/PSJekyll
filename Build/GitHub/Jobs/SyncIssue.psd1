@{
    "runs-on" = "ubuntu-latest"    
    if = '${{ success() }}'
    steps = @(
        @{
            name = 'Check out repository'
            uses = 'actions/checkout@v4'
        }
        @{
            name = 'Use PSJekyll Action'
            uses = 'PowerShellWeb/PSJekyll@main'
            id  = 'PSJekyll'
            with = @{                
                CommitMessage = 'Syncing Issues [skip ci]'
            }
        }
    )
}