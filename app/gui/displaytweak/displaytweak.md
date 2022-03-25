# Display Tweaks


## Windows

### checkbox:Dark mode for system
`Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\themes\personalize -Name SystemUsesLightTheme -Type DWord -Value 0`

### checkbox:Dark mode for apps
`Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\themes\personalize -Name AppsUseLightTheme -Type DWord -Value 0`

### checkbox:Set taskbar 'small icons'
`Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarSmallIcons -Type DWord -Value 1`

### checkbox:Don't hide icons in tray
`Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name EnableAutoTray -Type DWord -Value 0`


## Windows explorer (explorer.exe)

### checkbox:Home: Set home as 'This PC'
`Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1`

### checkbox:Home: Remove 'Folder' shortcuts
`. "$md2guiDirectory\gui\displaytweak\this_pc_shortcuts.ps1"`

### checkbox:All Folders: Reset folder view settings
`. "$md2guiDirectory\gui\displaytweak\reset_folder_defaults.ps1"`

### checkbox:All Folders: Show file extensions
`Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -Type DWord -Value 0`

### checkbox:All Folders: Show hidden files
`Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Hidden -Type DWord -Value 1`

### checkbox:Quick Access: Don't add frequently used folders
`Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowFrequent -Type DWord -Value 0`

### checkbox:Quick Access: Don't add recently used files
`Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -Type DWord -Value 0`


## Windows behaviour

### checkbox:Disable Automatic Folder Type Discovery
`Set-ItemProperty -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" -Name FolderType -Type String -Value NotSpecified`

### checkbox:Disable UAC
`Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Type DWord -Value 0`

### checkbox:Restart explorer.exe
`Stop-Process -ProcessName explorer`


## Currently its one-way only.
## This tool cannot undo the above actions.
