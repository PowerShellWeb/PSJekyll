Start-PSJekyll
--------------

### Synopsis
Starts a Jekyll server

---

### Description

Starts a Jekyll server in a PowerShell job.

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

#### **Config**
One or more config files to use

|Type        |Required|Position|PipelineInput|Aliases      |
|------------|--------|--------|-------------|-------------|
|`[String[]]`|false   |2       |false        |Configuration|

#### **SourcePath**
The source directory

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **DestinationPath**
The destination directory

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **HostHeader**
The host header

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Port**
The port to listen on

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |6       |false        |

#### **PluginPath**
The path to the plugin files

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |7       |false        |

#### **ShowDirectoryList**
If set, will show a directory list.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **LiveReload**
If set, will enable live reload.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **Watch**
Watch for changes and rebuild

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PreviewFuture**
If set, will publish posts with a future date (previewing them).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BaseUrl**
The base URL for the site

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **Detach**
If set, will detach the process

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Incremental**
Enable incremental rebuilds

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Start-PSJekyll [[-Name] <String>] [[-Config] <String[]>] [[-SourcePath] <String>] [[-DestinationPath] <String>] [[-HostHeader] <String>] [[-Port] <UInt32>] [[-PluginPath] <String[]>] [-ShowDirectoryList] [-LiveReload] [-LiquidProfile] [-Trace] [-Watch] [-PreviewFuture] [[-BaseUrl] <String>] [-Detach] [-Incremental] [<CommonParameters>]
```
