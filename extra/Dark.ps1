Write-Host
Write-Host "enable dark theme for windows (windows settings / windows update / calc / etc)"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\ -Name AppsUseLightTheme -Type DWord -Value 0
