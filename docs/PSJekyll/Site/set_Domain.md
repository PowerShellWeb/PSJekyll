PSJekyll.Site.set_Domain()
--------------------------

### Synopsis
Sets the domain name of the site.

---

### Description

Sets the domain name of the Jekyll site.  

This will create a CNAME file in the root of the site.

This will also attempt to resolve the domain name to ensure it is valid, and will write a warning if it is not.

---

### Examples
> EXAMPLE 1

```PowerShell
$PSJekyll.CurrentSite.Domain = 'psjekyll.powershellweb.com'
```

---

### Parameters
#### **cname**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---
