# norgeous/win10fix

### button:Chocolatey...
`cd ..\..\`
`.\\md2gui.ps1 gui\chocolatey\chocolatey.md`
### button:Remove OneDrive
`.\\RemoveOneDrive.bat`
### button:Remove win10 bloatware
`.\\crapware.ps1`
### button:Display tweak
`cd ..\displaytweak`
`.\\displaytweak.ps1`
### button:Disable UAC
`Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Type DWord -Value 0`
### button:Restart explorer.exe
`Stop-Process -ProcessName explorer`
### button:Quit
`Exit 500`
