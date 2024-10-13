PSJekyll.Template.Include.Margin.html()
---------------------------------------

### Synopsis
Includes site margins

---

### Description

Includes site margins in the site.

This will add a style tag with the margin.  It should be located in the head of the site.

If the margin parameter is provided, it will be used.  

Otherwise, the `page.margin` or `site.margin` will be used.

If neither margin exists, it will default to a margin of `1em` for all elements, 
and `0.5em` for all elements when the screen is less than `960px`.

---

### Parameters
#### **Margin**
The margin to include.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---
