Write-Host "Explorer folder view use 'details'"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\ShellNoRoam\Bags\AllFolders\Shell -Name Mode -Type DWord -Value 4
Write-Host