If (-Not $Script:arguments) {$Script:arguments=@(); ForEach ($Local:v in $Args) {$Script:arguments += $Local:v}}
$bat_to_install = $Script:arguments[0]

Copy-Item "$pwd\$bat_to_install" "C:\$bat_to_install"
Write-Host "$bat_to_install copied to C:\$bat_to_install"

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\$bat_to_install.lnk")
$Shortcut.TargetPath = "C:\$bat_to_install"
$Shortcut.Save()
Write-Host "windows autostart created for C:\$bat_to_install"

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\$bat_to_install.lnk")
$Shortcut.TargetPath = "C:\$bat_to_install"
$Shortcut.Save()
Write-Host "windows start menu shortcut installed for $bat_to_install"
