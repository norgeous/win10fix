#norgeous/win10fix

wd:..\tools

##Recommended
###button:Remove OneDrive
`.\\RemoveOneDrive.bat`
###button:Display tweak
`.\\displaytweak.ps1`

##Chocolatey
###button:install chocolatey (requires restart)
`iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))`
###button:install apps (requires chocolatey)
`cd ..\menus`
`.\\gui.ps1 chocoapps.md`
###button:install developer apps (requires chocolatey)
`cd ..\menus`
`.\\gui.ps1 developerapps.md`
###button:install chocolatey autoupdater
`cd cupally`
`.\\install.ps1`

##Experimental
###button:Remove default bloat (experimental)
`.\\Crapware.ps1`