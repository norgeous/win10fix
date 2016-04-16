

#http://www.tenforums.com/tutorials/17707-folder-view-settings-reset-default-windows-10-a.html
Write-Host
Write-Host "Reset Folder View Settings of All Folders to Default"
.\\Reset_Folder_View_Settings_of_All_Folders_to_Default.bat

#http://www.askvg.com/how-to-fix-annoying-folder-view-type-problem-in-windows-vista/
Write-Host
Write-Host "Disable Automatic Folder Type Discovery"
regedit /s $pwd\Disable_Automatic_Folder_Type_Discovery.reg

Write-Host
Write-Host "Changing 'File Explorer' home screen back to 'This PC'"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1

Write-Host
Write-Host "Removing 'Folders' shortcuts from 'This PC'"
regedit /s $pwd\64-bit_Remove_All_user_Folders_in_This_PC.reg

Write-Host
Write-Host "unhide file extensions"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -Type DWord -Value 0

Write-Host
Write-Host "unhide hidden files"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Hidden -Type DWord -Value 1

Write-Host
Write-Host "Taskbar tray use 'small icons'"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarSmallIcons -Type DWord -Value 1

Write-Host
Write-Host "Don't hide icons in tray"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name EnableAutoTray -Type DWord -Value 0

Write-Host
Write-Host "Restart windows explorer"
.\\Restart_windows_explorer.bat