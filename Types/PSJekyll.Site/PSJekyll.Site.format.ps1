Write-FormatView -TypeName PSJekyll.Site -Property SiteName, 'Page.Count', 'Post.Count' -VirtualProperty @{
    'Page.Count' = { $_.Page.Count }
    'Post.Count' = { $_.Post.Count }
} 