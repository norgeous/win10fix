Write-Host
Write-Host "Changing 'File Explorer' home screen back to 'This PC'"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1

Write-Host
Write-Host "Removing 'Folders' shortcuts from 'This PC'"
regedit /s $pwd\64-bit_Remove_All_user_Folders_in_This_PC.reg
