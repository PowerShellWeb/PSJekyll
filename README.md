<div align='center'>
<img src='Assets/PSJekyll-Animated.svg' />
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

## PSJekyll Container

PSJekyll ships every build in a container.

To pull down PSJekyll and start your own server, use something like:

~~~PowerShell
docker pull ghcr.io/powershellweb/psjekyll

docker run -interactive --tty --publish 8069:4000 ghcr.io/powershellweb/psjekyll
~~~

## PSJekyll Commands

* `New-PSJekyll` creates sites with `jekyll new`.
* `Start-PSJekyll` starts Jekyll servers in a jobs.
* `Stop-PSJekyll` stops running Jekyll jobs.