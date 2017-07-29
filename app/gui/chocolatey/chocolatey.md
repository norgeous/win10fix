# Chocolatey

### button:Install Chocolatey
`iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))`

### button:Essential Chocolatey apps...
`. "$md2guiDirectory\md2gui.ps1" "$md2guiDirectory\gui\chocolatey\essential.md"`

### button:Developer Chocolatey apps...
`. "$md2guiDirectory\md2gui.ps1" "$md2guiDirectory\gui\chocolatey\developer.md"`

### button:Update all Chocolatey packages now
`cup all -y`

### button:Update all Chocolatey packages on StartUp
`. "$md2guiDirectory\gui\chocolatey\cupally\install_bat.ps1" "$md2guiDirectory\gui\chocolatey\cupally\cupally.bat"`

### button:Atom packages...
`. "$md2guiDirectory\md2gui.ps1" "$md2guiDirectory\gui\apm.md"`
