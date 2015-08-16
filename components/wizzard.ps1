If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")){
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    Break
}

function Prompt-Choice([array]$options){
	$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
	Foreach ($option in $options) {
		$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList $option))
	}
	return $Host.UI.PromptForChoice("", "", $choices, 0)
}

clear
Write-Host "`n"
Write-Host "Intro text"
Write-Host "`n"
Write-Host "Please read the options carefully!"
Write-Host "`n"
Write-Host "Continue?"
Switch(Prompt-Choice @('&Yes','&No')) {
	1{
		Break
	}
}

clear
Write-Host "`n"
Write-Host "Install Chocolatey and Chocolatey GUI?"
Write-Host "`n"
Switch(Prompt-Choice @('&Both','&Chocolatey only','&Neither')){
	0{
		clear
		Write-Host "`n"
		Write-Host "Installing Chocolatey"
		Write-Host "`n"
		#iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
		Write-Host "`n"
		Write-Host "Installing Chocolatey GUI"
		Write-Host "`n"
		#choco install -y chocolateygui
	}
	1{
		clear
		Write-Host "`n"
		Write-Host "Installing Chocolatey"
		Write-Host "`n"
		#iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
	}
	2{
		Write-Host "`n"
		Write-Host "Skipping"
	}
}
Write-Host "`n"
pause

clear
Write-Host "`n"
Write-Host "Install ccleaner?"
Write-Host "`n"
Switch(Prompt-Choice @('&Yes','&No')){
	0{
		clear
		Write-Host "`n"
		Write-Host "Installing ccleaner"
		Write-Host "`n"
		#choco install -y ccleaner
	}
	1{
		Write-Host "`n"
		Write-Host "Skipping"
	}
}
Write-Host "`n"
pause

clear
Write-Host "`n"
Write-Host "Install defraggler?"
Write-Host "`n"
Switch(Prompt-Choice @('&Yes','&No')){
	0{
		clear
		Write-Host "`n"
		Write-Host "Installing defraggler"
		Write-Host "`n"
		#choco install -y defraggler
	}
	1{
		Write-Host "`n"
		Write-Host "Skipping"
	}
}
Write-Host "`n"
pause


clear
Write-Host "`n"
Write-Host "Install vlc?"
Write-Host "`n"
Switch(Prompt-Choice @('&Yes','&No')){
	0{
		clear
		Write-Host "`n"
		Write-Host "Installing vlc"
		Write-Host "`n"
		#choco install -y vlc
	}
	1{
		Write-Host "`n"
		Write-Host "Skipping"
	}
}
Write-Host "`n"
pause


clear
Write-Host "`n"
Write-Host "Install libreoffice?"
Write-Host "`n"
Switch(Prompt-Choice @('&Yes','&No')){
	0{
		clear
		Write-Host "`n"
		Write-Host "Installing libreoffice"
		Write-Host "`n"
		#choco install -y libreoffice
	}
	1{
		Write-Host "`n"
		Write-Host "Skipping"
	}
}
Write-Host "`n"
pause


clear
Write-Host "`n"
Write-Host "Install sublimetext3?"
Write-Host "`n"
Switch(Prompt-Choice @('&Yes','&No')){
	0{
		clear
		Write-Host "`n"
		Write-Host "Installing sublimetext3"
		Write-Host "`n"
		#choco install -y sublimetext3
	}
	1{
		Write-Host "`n"
		Write-Host "Skipping"
	}
}
Write-Host "`n"
pause


clear
Write-Host "`n"
Write-Host "Install geforce-experience?"
Write-Host "`n"
Switch(Prompt-Choice @('&Yes','&No')){
	0{
		clear
		Write-Host "`n"
		Write-Host "Installing geforce-experience"
		Write-Host "`n"
		#choco install -y geforce-experience
	}
	1{
		Write-Host "`n"
		Write-Host "Skipping"
	}
}
Write-Host "`n"
pause


clear
Write-Host "`n"
Write-Host "Install allbrowsers?"
Write-Host "`n"
Switch(Prompt-Choice @('&Yes','&No')){
	0{
		clear
		Write-Host "`n"
		Write-Host "Installing allbrowsers"
		Write-Host "`n"
		#choco install -y allbrowsers
	}
	1{
		Write-Host "`n"
		Write-Host "Skipping"
	}
}
Write-Host "`n"
pause


clear
Write-Host "`n"
Write-Host "Install firefox?"
Write-Host "`n"
Switch(Prompt-Choice @('&Yes','&No')){
	0{
		clear
		Write-Host "`n"
		Write-Host "Installing firefox"
		Write-Host "`n"
		#choco install -y firefox
	}
	1{
		Write-Host "`n"
		Write-Host "Skipping"
	}
}
Write-Host "`n"
pause


clear
Write-Host "`n"
Write-Host "Install google-chrome-x64?"
Write-Host "`n"
Switch(Prompt-Choice @('&Yes','&No')){
	0{
		clear
		Write-Host "`n"
		Write-Host "Installing google-chrome-x64"
		Write-Host "`n"
		#choco install -y google-chrome-x64
	}
	1{
		Write-Host "`n"
		Write-Host "Skipping"
	}
}
Write-Host "`n"
pause




# if(Prompt-YesNo "Remove Windows Crapware (3d, bing, communi, people, phone, zune, xbox, onenote, MicrosoftOfficeHub, WindowsMaps)" '&yes' '&choose'){
# 
# 	Get-AppxPackage *3d* | Remove-AppxPackage
# 	Get-AppxPackage *bing* | Remove-AppxPackage
# 	Get-AppxPackage *communi* | Remove-AppxPackage
# 	Get-AppxPackage *people* | Remove-AppxPackage
# 	Get-AppxPackage *phone* | Remove-AppxPackage
# 	Get-AppxPackage *zune* | Remove-AppxPackage
# 	Get-AppxPackage *xbox* | Remove-AppxPackage
# 	Get-AppxPackage *onenote* | Remove-AppxPackage
# 	Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage
# 	Get-AppxPackage *WindowsMaps* | Remove-AppxPackage
# 	pause
# }
# else {
# 	
# 	pause
# 
# 	if(Prompt-YesNo "remove 3d package(s)" '&yes' '&no')					{Get-AppxPackage *3d* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove bing package(s)" '&yes' '&no')					{Get-AppxPackage *bing* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove communi package(s)" '&yes' '&no')				{Get-AppxPackage *communi* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove people package(s)" '&yes' '&no')				{Get-AppxPackage *people* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove phone package(s)" '&yes' '&no')					{Get-AppxPackage *phone* | Remove-AppxPackage;pause} else {pause}
Write-Host "`n"
# 	if(Prompt-YesNo "remove zune package(s)" '&yes' '&no')					{Get-AppxPackage *zune* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove xbox package(s)" '&yes' '&no')					{Get-AppxPackage *xbox* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove onenote package(s)" '&yes' '&no')				{Get-AppxPackage *onenote* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove MicrosoftOfficeHub package(s)" '&yes' '&no')	{Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove WindowsMaps package(s)" '&yes' '&no')			{Get-AppxPackage *WindowsMaps* | Remove-AppxPackage;pause} else {pause}
# }
# 

clear
Write-Host "wizzard complete"
pause


################## ADD LATER
# choco install -y tightvnc sandboxie geforce-experience ccleaner defraggler vlc itunes libreoffice blender sysinternals procexp procmon
# choco install -y allbrowsers sublimetext3 filezilla nodejs putty github virtualbox autohotkey grepwin
# choco install -y adb
# :: choco install -y jdk7 android-sdk
# :: choco install -y kodi
# :: choco install -y phantomjs
# :: didnt work
# :: avirafreeantivirus glasswire steam skype 7zip winrar handbrake
