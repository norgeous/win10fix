#norgeous/win10fix

##Recommended
###button:Remove OneDrive
`.\\..\tools\RemoveOneDrive.bat`
###button:Display tweak
`.\\..\tools\displaytweak.ps1`

##Chocolatey
###button:install chocolatey (requires restart)
`iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))`
###button:install apps (requires chocolatey)
`.\\gui.ps1 chocoapps.md`
###button:install chocolatey autoupdater
`.\\..\tools\cupally\install.ps1`

##Experimental
###button:Remove default bloat (experimental)
`.\\..\tools\Crapware.ps1`