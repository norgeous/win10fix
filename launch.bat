@@ECHO off
@@setlocal EnableDelayedExpansion
@@set LF=^


@@SET command=$Script:WorkingDirectory="%cd%"
@@SET command=!command!!LF!$Script:Origin="%~0"
@@SET command=!command!!LF!$Script:ToolDirectory=(Split-Path -Path "%~0")
@@SET command=!command!!LF!$Script:ToolFile=(Split-Path -Leaf "%~0")
@@SET command=!command!!LF!$Script:Arguments=@()
@@FOR %%x in (%*) do SET command=!command!!LF!$Script:Arguments+="%%~x"
@@FOR /F "tokens=*" %%i in ('Findstr -r "^@@# " "%~f0"') DO (SET "s=%%i" && SET command=!command!!LF!!s:@@# =!)
@@SET "ps1file=%temp%\%~nx0.launcher.ps1"
@@ECHO !command! > "%ps1file%"
@@START PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoExit -NoProfile -ExecutionPolicy Bypass -File ""%ps1file%""' -Verb RunAs}"
@@goto:eof
@@# Set-Location "$Script:WorkingDirectory"
@@# $Local:ps1launcherfile = ('{0}\{1}.launcher.ps1' -f $env:temp, $Script:ToolFile)
@@# Remove-Item "$Local:ps1launcherfile"
@@# $Script:ps1file = ('{0}\{1}.ps1' -f $env:temp, $Script:ToolFile)
@@# Select-String -path ('{0}\{1}' -f $Script:ToolDirectory, $Script:ToolFile) -pattern "^@@" -notmatch | % {$_.line} > "$Script:ps1file"
@@# . "$Script:ps1file"
@@# kill $pid
Remove-Item "$Script:ps1file"

# Write-Host "Tool`t`t`t$Script:ToolDirectory + $Script:ToolFile (tool.bat info)"
# Write-Host "ps1file`t`t`t$Script:ps1file (file running in temp dir)"
# Write-Host "WorkingDirectory`t$Script:WorkingDirectory (where tool.bat was called from)"
# Write-Host "Arguments`t`t$Script:Arguments (arguments supplied to tool.bat)"
# Write-Host "`$pwd`t`t`t$pwd (current working directory)"
# Write-Host

$Script:md2guiDirectory = "$Script:ToolDirectory\app"
$LASTEXITCODE = 0
while($LASTEXITCODE -eq 0)
{
  Write-Host " --------------------------------"
  . "$Script:md2guiDirectory\md2gui.ps1" "$Script:md2guiDirectory\gui\main\main_menu.md" "$Script:Arguments"
  Write-Host " --------------------------------"
}
Write-Host " >>> exiting..."
Write-Host
If($LASTEXITCODE -eq 410) {
  Start-Sleep -s 1
}
Else {
  PAUSE
}
