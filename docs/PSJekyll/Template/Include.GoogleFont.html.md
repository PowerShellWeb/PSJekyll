PSJekyll.Template.Include.GoogleFont.html()
-------------------------------------------

### Synopsis
Includes a Google Font.

---

### Description

Includes a Google Font in the site.

This will add a link to the Google Font.

It can be located within the site or page front matter.

---

### Parameters
#### **FontName**
The name of the font to include.
If no value is directly provided, it will attempt to find a value in site.googleFont.
If no font is found, it will default to Roboto.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **CodeFont**
The code font to include.
If no code font is provided, it will default to Roboto Mono.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---
