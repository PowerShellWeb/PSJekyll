PSJekyll.Site.set_Config()
--------------------------

### Synopsis
Gets the config of the site.

---

### Description

Gets the configuration of the Jekyll site.  

This can be provided by a _config.yml file in the root of the site (and essentially marks it as a site)

---

### Examples
> EXAMPLE 1

```PowerShell
$psJekyll.CurrentSite.Config = [Ordered]@{
    title = 'My Awesome Site'
    description = 'This is a site that is awesome.'
    permalink = 'pretty'
}
```

---

### Parameters
#### **Value**
The new configuration object.
This will be converted to YAML and added to the _config.yml file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---
