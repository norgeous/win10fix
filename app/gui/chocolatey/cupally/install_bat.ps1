$Local:BatDirectory = (Split-Path -Path $Args[0])
$Local:BatFile = (Split-Path -Leaf $Args[0])

Copy-Item "$Local:BatDirectory\$Local:BatFile" "C:\$Local:BatFile"
Write-Host "$Local:BatFile copied to C:\$Local:BatFile"

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\$Local:BatFile.lnk")
$Shortcut.TargetPath = "C:\$Local:BatFile"
$Shortcut.Save()
Write-Host "windows autostart created for C:\$Local:BatFile"

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\$Local:BatFile.lnk")
$Shortcut.TargetPath = "C:\$Local:BatFile"
$Shortcut.Save()
Write-Host "windows start menu shortcut installed for $Local:BatFile"
