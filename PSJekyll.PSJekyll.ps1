# PSJekyll site self creation
$sitePath = Join-Path $PSScriptRoot 'docs'

$sourceModule = Import-Module ./ -PassThru


Push-Location $sitePath
$PSJekyll.CurrentSite.Domain = "psjekyll.powershellweb.com"
$PSJekyll.CurrentSite.Data = @{LastDateBuilt = [datetime]::UtcNow.Date.ToString('yyyy-MM-dd')}
$PSJekyll.CurrentSite.Data = @{
    "PSModule/Info" = $sourceModule |
        Select-Object -Property Name, 
            Version, 
            Description, 
            Copyright, 
            CompanyName, 
            Author,
            @{
                Name = 'Tags'
                Expression = { @($_.PrivateData.PSData.Tags | Select-Object -Unique)}
            }            
    "PSModule/Exports" = @(
        foreach ($command in $sourceModule.ExportedCommands.Values) {
            [Ordered]@{
                Name = $command.Name
                CommandType = $command.CommandType
                Definition = $command.Definition
                ParameterName = $command.Parameters.Keys
                Parameter = @(
                    $command.Parameters.Values | 
                        Select-Object -Property Name, 
                            @{
                                Name='ParameterType'
                                Expression = { $_.ParameterType.ToString() }
                            },                            
                            Position, 
                            Mandatory, 
                            ValueFromPipeline, 
                            ValueFromPipelineByPropertyName, 
                            ValueFromRemainingArguments, 
                            HelpMessage
                )
            }       
        }
    )
        
    "PSModule/FunctionNames" = $sourceModule.ExportedFunctions.Keys
    "PSModule/CmdletNames"   = $sourceModule.ExportedCmdlets.Keys
    "PSModule/AliasNames"    = $sourceModule.ExportedAliases.Keys
    "PSModule/Aliases" = @($sourceModule.ExportedAliases.Values |
        ForEach-Object { [Ordered]@{Name=$_.Name;Definition=$_.Definition} })

    "PSModule/VariableNames" = $sourceModule.ExportedVariables.Keys
    "PSModule/TypeNames"     = $sourceModule.ExportedTypeFiles | 
        ForEach-Object { (Select-Xml -XPath //Types/Type -Path $_).Node.Name }
    
}
$PSJekyll.CurrentSite.Data
# It is important to use [Ordered], otherwise, the order of the keys will be random.
# (this will generate more changes than necessary in the git repository, and will be noisier than desired)
$PSJekyll.CurrentSite.Config = [Ordered]@{
    title = "PSJekyll"
    description = "A PowerShell module for creating Jekyll sites."    
    url = "https://psjekyll.powershellweb.com"
    permalink = 'pretty'
    palette = 'Konsolas'
    analyticsId = 'G-R5C30737B2'
    googleFont = 'Noto Sans'
    stylesheet = 'https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css'
    defaults = @([Ordered]@{
        values = @{layout='Default'}
    })
}
$PSJekyll.CurrentSite.Config

foreach ($templateMember in $PSJekyll.Template.psobject.Members) {
    if ($templateMember.Name -notmatch '^(?>layout|include)\p{P}{0,}') {
        continue
    }
    $templateFileType = $matches.0 -replace '\p{P}{0,}$'    
    $templateFileName = $templateMember.Name -replace "^$([Regex]::Escape($templateFileType))\p{P}{0,}"

    if ($templateMember.Name -notmatch '\.([^\.]+?)$') {
        $templateFileName += '.html'
    }
    $templateOut = 
        if ($templateMember.Invoke) {
            $templateMember.Invoke()
        } else {
            $templateMember.Value
        }
    try {
        $PSJekyll.CurrentSite.$templateFileType = $templateFileName, $templateOut
    } catch {
        $err = $_
        Write-Error -Message "Failed to set $templateFileName of $templateFileType : $err"
    }    
}

$PSJekyll.CurrentSite.Page = 'Tree', "{% include SiteTree.html %}"
$PSJekyll.CurrentSite.Page = 'Repos', "{% include Repos.md %}"
$PSJekyll.CurrentSite.Page = 'Releases', "{% include Releases.md %}"
$PSJekyll.CurrentSite.Page = 'Contibutors', "{% include Contributor.md %}"
$PSJekyll.CurrentSite.Page = 'Members', "{% include OrgMember.md %}"
$PSJekyll.CurrentSite.Page = 'Function', "{% include PSFunctions.md %}"
$PSJekyll.CurrentSite.Page = 'Functions', "{% include PSFunctions.md %}"
$PSJekyll.CurrentSite.Page = 'Alias', "{% include PSAlias.md %}"
$PSJekyll.CurrentSite.Page = 'Aliases', "{% include PSAlias.md %}"
$PSJekyll.CurrentSite.Page = 'Cmdlet', "{% include PSCmdlet.md %}"
$PSJekyll.CurrentSite.Page = 'Cmdlets', "{% include PSCmdlet.md %}"
$PSJekyll.CurrentSite.Page = 'PSTag', "{% include PSTag.md %}"
$PSJekyll.CurrentSite.Page = 'PSTypeName', "{% include PSTypeName.md %}"
$PSJekyll.CurrentSite.Layout
$PSJekyll.CurrentSite.Include
$PSJekyll.CurrentSite.Page

Pop-Location