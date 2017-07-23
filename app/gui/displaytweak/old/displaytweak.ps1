Write-Host "Changing explorer.exe home screen back to 'This PC'"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1

Write-Host "Removing 'Folders' shortcuts from 'This PC'"
#regedit /s $pwd\64-bit_Remove_All_user_Folders_in_This_PC.reg
$paths = @(
  "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\",
  "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\"
)
$keys = @(
  "{1CF1260C-4DD0-4ebb-811F-33C572699FDE}", # Music
  "{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}", # Music
  "{374DE290-123F-4565-9164-39C4925E467B}", # Downloads
  "{088e3905-0323-4b02-9826-5d99428e115f}", # Downloads
  "{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}", # Pictures
  "{24ad3ad4-a569-4530-98e1-ab02f9417aa8}", # Pictures
  "{A0953C92-50DC-43bf-BE83-3742FED03C9C}", # Videos
  "{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}", # Videos
  "{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}", # Documents
  "{d3162b92-9365-467a-956b-92703aca08af}", # Documents
  "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}"  # Desktop
)
Foreach ($path in $paths)
{
  Foreach ($key in $keys)
  {
    $pathkey = "$path$key"
    if (Get-Item "$pathkey" -ErrorAction SilentlyContinue) {
      Remove-Item "$pathkey" -Recurse
      Write-Host " $pathkey - deleted"
    } else {
      #New-Item -Path "$pathkey" | Out-Null # create key
      Write-Host " $pathkey - not found"
    }
  }
}

#http://www.tenforums.com/tutorials/17707-folder-view-settings-reset-default-windows-10-a.html
Write-Host "Reset Folder View Settings of All Folders to Default"
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




#$ext = ".md"

#$key = (Get-ItemProperty -Path HKLM:\SOFTWARE\Classes\$ext -Name "(Default)")."(Default)"
#$app = (Get-ItemProperty -Path HKLM:\SOFTWARE\Classes\$key\shell\open\command -Name "(Default)")."(Default)"
#Write-Host "$ext -> $key -> $app"

#$key = (Get-ItemProperty -Path HKCU:\SOFTWARE\Classes\$ext -Name "(Default)")."(Default)"
#$app = (Get-ItemProperty -Path HKCU:\SOFTWARE\Classes\$key\shell\open\command -Name "(Default)")."(Default)"
#Write-Host "$ext -> $key -> $app"
