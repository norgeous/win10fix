@@ECHO off
@@setlocal EnableDelayedExpansion
@@set LF=^


@@SET command=$Script:origin="%~0"
@@SET command=!command!!LF!$Script:arguments=@()
@@FOR %%x in (%*) do SET command=!command!!LF!$Script:arguments+="%%~x"
@@FOR /F "tokens=*" %%i in ('Findstr -r "^@@# " "%~f0"') DO (SET "s=%%i" && SET command=!command!!LF!!s:@@# =!)
@@SET "ps1file=%temp%\%~nx0.launcher.ps1"
@@ECHO !command! > "%ps1file%"
@@START PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoExit -NoProfile -ExecutionPolicy Bypass -File ""%ps1file%""' -Verb RunAs}"
@@goto:eof
@@# Set-Location (Split-Path -Path $Script:origin)
@@# $Script:ps1launcherfile = ('{0}\{1}.launcher.ps1' -f $env:temp, (Split-Path -Leaf $Script:origin))
@@# Remove-Item $Script:ps1launcherfile
@@# $Script:ps1file = ('{0}\{1}.ps1' -f $env:temp, (Split-Path -Leaf $Script:origin))
@@# Select-String -path $Script:origin -pattern "^@@" -notmatch | % {$_.line} > $Script:ps1file
@@# . $Script:ps1file
@@# kill $pid
Remove-Item $Script:ps1file


Set-Location "lib"
.\\menus\gui.ps1 menus\main.md

PAUSE