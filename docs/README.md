<div align='center'>
    <img alt='PSJekyll Logo (Animated)' style='height:50%' src='Assets/PSJekyll-Animated.svg' />
</div>

# PSJekyll

Scarily Simple Static Sites with Jekyll and PowerShell

[Jekyll](https://jekyllrb.com) is a static site generator and server.

PowerShell is a dynamic scripting language that works with everything.

PSJekyll is a PowerShell module for managing Jekyll websites.

## PSJekyll Basics

You can install PSJekyll from the Gallery:

~~~PowerShell
Install-Module PSJekyll -Force -Scope CurrentUser
~~~

Then you can import it by name:

~~~PowerShell
Import-Module PSJekyll
~~~

`$psJekyll.Site` will have any sites beneath the current directory:

~~~PowerShell
# Push into the PSJekyll module, which will have a site
Get-Module PSJekyll | Split-Path | Push-Location
$psJekyll.Site # output the site
~~~

### Setting configuration

You can set a new configuration file by using:

~~~PowerShell
# Ideally, pass all values in within `[Ordered]` hashtables.
# otherwise the file may change more often than expected.
$psJekyll.Site.Config = [Ordered]@{}
~~~

### Setting data

You can set site data in almost the same way as you set configuration:

~~~PowerShell
$psJekyll.Site.Data = @{"MyFavoriteNumber"=42}
~~~


### Setting pages

~~~PowerShell
# This will create a page that will contain a repository list (in a GitHub page)
$psJekyll.Site.Page = "MyPage", "My Content", @{MyMetadata=$true}
~~~

## PSJekyll GitHub Action

You can easily use PSJekyll as a GitHub Action.

This helps you automate updating content and data within a Jekyll site or GitHub Page.

~~~yaml
- name: UsePSJekyll
- uses: PowerShellWeb/PSJekyll@main
~~~

Using this action will run any `*.PSJekyll.ps1` files in your repository.

Any files outputted from this will be checked into the current branch.

## PSJekyll Container

PSJekyll ships every build in a container.

To pull down PSJekyll and start your own server, use something like:

~~~PowerShell
# Pull down the latest image
docker pull ghcr.io/powershellweb/psjekyll

# Start the image in an interactive terminal on port 8069.
docker run --interactive --tty --publish 8069:4000 ghcr.io/powershellweb/psjekyll
~~~

## PSJekyll Commands

* New-PSJekyll creates Jekyll sites.
* Start-PSJekyll starts Jekyll servers in a job.
* Stop-PSJekyll stops running Jekyll jobs.
