PSJekyll.Template.IncludeImportMap()
------------------------------------

### Synopsis
Includes an import map.

---

### Description

Includes an import map in the site.

This will add a script tag with the import map.  It should be located in the head of the site.

If the importmap parameter is provided, it will be used.  Otherwise, the site.data.imports will be used.

---

### Parameters
#### **ImportMap**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---
