# Chocolatey

### button:Install Chocolatey
`iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))`
### button:Essential apps...
`cd ..\..\`
`.\\md2gui.ps1 gui\chocolatey\essential.md`
### button:Developer apps...
`cd ..\..\`
`.\\md2gui.ps1 gui\chocolatey\developer.md`
### button:Update all now
`cup all -y`
### button:Update on StartUp
`cd cupally`
`.\\install_bat.ps1 cupally.bat`
