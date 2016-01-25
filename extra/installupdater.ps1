Copy-Item "$pwd\cupally.bat" "C:\cupally.bat"
Write-Host
Write-Host "bat installed"

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cupally.bat.lnk")
$Shortcut.TargetPath = "C:\cupally.bat"
$Shortcut.Save()
Write-Host
Write-Host "startup entry shortcut installed"

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\cupally.bat.lnk")
$Shortcut.TargetPath = "C:\cupally.bat"
$Shortcut.Save()
Write-Host
Write-Host "start menu shortcut installed"