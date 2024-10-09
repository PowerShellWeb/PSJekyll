<div align='center'>
    <img alt='PSJekyll Logo (Animated)' style='height:50%' src='Assets/PSJekyll-Animated.svg' />
</div>

# PSJekyll

Scary Simple Static Sites with PowerShell and Jekyll

[Jekyll](https://jekyllrb.com) is a static site generator and server.

PowerShell is a dynamic scripting language that works with everything.

PSJekyll is a PowerShell module for managing Jekyll websites.

## PSJekyll GitHub Action

You can easily use PSJekyll as a GitHub Action.

This helps you automate updating content and data within a Jekyll site or GitHub Page.

~~~yaml
- name: UseEZOut
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