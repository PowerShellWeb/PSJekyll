PSJekyll.get_CurrentSite()
--------------------------

### Synopsis
Gets the current site.

---

### Description

Gets one or more current Jekyll sites.

The current site is any directory containing a _config.yml.  

If no directory is found, it will consider the the current directory to be the site.

---

### Examples
> EXAMPLE 1

```PowerShell
$psJekyll.CurrentSite
```

---

### Parameters
#### **this**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---
