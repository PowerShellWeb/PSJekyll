New-PSJekyll
------------

### Synopsis
Creates a new Jekyll site.

---

### Description

Creates a new Jekyll site, using PowerShell.

---

### Related Links
* [https://jekyllrb.com/](https://jekyllrb.com/)

---

### Parameters
#### **Name**
The name of the Jekyll site

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Blank**
Creates scaffolding but with empty files

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
Force creation even if PATH already exists

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Safe**
Safe mode

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipBundle**
Skip the bundle install

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SourcePath**
The path to the source files

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **DestinationPath**
The path to the destination files

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **LayoutPath**
The path to the layout files

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **PluginPath**
The path to the plugin files

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

#### **LiquidProfile**
If set,  will generate a liquid profile

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Trace**
If set, will trace the execution

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-PSJekyll [[-Name] <String>] [-Blank] [-Force] [-Safe] [-SkipBundle] [[-SourcePath] <String>] [[-DestinationPath] <String>] [[-LayoutPath] <String>] [[-PluginPath] <String[]>] [-LiquidProfile] [-Trace] [<CommonParameters>]
```
