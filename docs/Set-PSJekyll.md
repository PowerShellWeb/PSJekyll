Set-PSJekyll
------------

### Synopsis
Sets the content of a file in Jekyll

---

### Description

Sets the content of a file in Jekyll.

This is only slightly smarter than Set-Content.  

It will convert the content to JSON if the file ends in .json, and to CSV if the file ends in .csv or .tsv.

Otherwise, it will create a YAML header and then set the content.

---

### Parameters
#### **Path**
The path to the file.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |1       |false        |FullName|

#### **PassThru**
If set, will return the file object

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Content**
The content to set

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |named   |true (ByValue)|

#### **MetaData**
Any metadata to set.  
This will create a YAML header, which is required for most files in Jekyll to be processed properly.

|Type           |Required|Position|PipelineInput|Aliases   |
|---------------|--------|--------|-------------|----------|
|`[IDictionary]`|false   |named   |false        |YamlHeader|

---

### Syntax
```PowerShell
Set-PSJekyll [-Path] <String> [-PassThru] [-Content <Object>] [-MetaData <IDictionary>] [<CommonParameters>]
```
