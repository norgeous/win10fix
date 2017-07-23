Write-Host "Changing explorer.exe home screen back to 'This PC'"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1

Write-Host "Removing 'Folders' shortcuts from 'This PC'"
regedit /s $pwd\64-bit_Remove_All_user_Folders_in_This_PC.reg

# Music
#Set-ItemProperty -Path "HKLM:\SOFTWARE\Classes\CLSID\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -Name System.IsPinnedToNameSpaceTree -Value 0

#http://www.tenforums.com/tutorials/17707-folder-view-settings-reset-default-windows-10-a.html
Write-Host "Reset Folder View Settings of All Folders to Default $pwd"
.\\Reset_Folder_View_Settings_of_All_Folders_to_Default.bat

#http://www.askvg.com/how-to-fix-annoying-folder-view-type-problem-in-windows-vista/
Write-Host "Disable Automatic Folder Type Discovery"
regedit /s $pwd\Disable_Automatic_Folder_Type_Discovery.reg

Write-Host "Unhide file extensions"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -Type DWord -Value 0

Write-Host "Unhide hidden files"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Hidden -Type DWord -Value 1

Write-Host "Taskbar / tray use 'small icons'"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarSmallIcons -Type DWord -Value 1

Write-Host "Don't hide icons in tray"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name EnableAutoTray -Type DWord -Value 0




$ext = ".md"

#$key = (Get-ItemProperty -Path HKLM:\SOFTWARE\Classes\$ext -Name "(Default)")."(Default)"
#$app = (Get-ItemProperty -Path HKLM:\SOFTWARE\Classes\$key\shell\open\command -Name "(Default)")."(Default)"
#Write-Host "$ext -> $key -> $app"

$key = (Get-ItemProperty -Path HKCU:\SOFTWARE\Classes\$ext -Name "(Default)")."(Default)"
$app = (Get-ItemProperty -Path HKCU:\SOFTWARE\Classes\$key\shell\open\command -Name "(Default)")."(Default)"
Write-Host "$ext -> $key -> $app"
