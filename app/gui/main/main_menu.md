# norgeous/win10fix

### button:Chocolatey...
`cd ..\..\`
`.\\md2gui.ps1 gui\chocolatey\chocolatey.md`
### button:Atom packages...
`cd ..\..\`
`.\\md2gui.ps1 gui\apm.md`
### button:Remove OneDrive
`.\\RemoveOneDrive.bat`
### button:Remove win10 bloatware
`.\\crapware.ps1`
### button:Display tweaks...
`cd ..\..\`
`.\\md2gui.ps1 gui\displaytweak\displaytweak.md`
### button:Disable UAC
`Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Type DWord -Value 0`
### button:Restart explorer.exe
`Stop-Process -ProcessName explorer`
### button:Quit
`Exit 500`
