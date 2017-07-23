# Display Tweaks

### checkbox:Set explorer.exe home as 'This PC'
`Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1`

### checkbox:Remove 'Folder' shortcuts from 'This PC'
`.\\this_pc_shortcuts.ps1`

### checkbox:Set Folder View Settings to Default (All Folders)
`.\\reset_folder_defaults.ps1`

### checkbox:Disable Automatic Folder Type Discovery
`regedit /s $pwd\Disable_Automatic_Folder_Type_Discovery.reg`

### checkbox:Show file extensions
`Write-Host 'Show file extensions'`
`Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -Type DWord -Value 0`

### checkbox:Show hidden files
`Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Hidden -Type DWord -Value 1`

### checkbox:Set taskbar 'small icons'
`Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarSmallIcons -Type DWord -Value 1`

### checkbox:Don't hide icons in tray
`Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name EnableAutoTray -Type DWord -Value 0`

## Currently its one way only.
## This tool cannot undo the above actions.
