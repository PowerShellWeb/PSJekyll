<#
.SYNOPSIS
    Gets the posts in a site.
.DESCRIPTION
    Gets the post files in a Jekyll site.

    Any file in the _posts directory is considered a post.
.EXAMPLE
    $psJekyll.CurrentSite.Post
.LINK
    https://jekyllrb.com/docs/posts/
#>
param()

foreach ($specialFile in $this.File -match '[\\/]_posts[\\/]') {    
    $specialFile.pstypenames.add("PSJekyll.Published.Post")
    $specialFile.pstypenames.add("PSJekyll.Post")    
    $specialFile
}
