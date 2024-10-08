PSJekyll.Template.IncludeImportMap()
------------------------------------

### Synopsis
Includes an import map.

---

### Description

Includes an import map in the site.

This will add a script tag with the import map.  It should be located in the head of the site.

An importmap can be defined in the front matter of a page, in the site data, or in the site configuration.

It may be called either `.imports` or `.importMap`.

---

### Parameters
#### **ImportMap**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---
