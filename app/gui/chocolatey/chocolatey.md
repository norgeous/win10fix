# Chocolatey

### button:Install Chocolatey
`iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))`

### button:Essential Chocolatey apps...
`cd ..\..\`
`.\\md2gui.ps1 gui\chocolatey\essential.md`

### button:Developer Chocolatey apps...
`cd ..\..\`
`.\\md2gui.ps1 gui\chocolatey\developer.md`
### button:Update all Chocolatey packages now
`cup all -y`

### button:Update all Chocolatey packages on StartUp
`cd cupally`
`.\\install_bat.ps1 cupally.bat`

### button:Atom packages...
`cd ..\..\`
`.\\md2gui.ps1 gui\apm.md`
