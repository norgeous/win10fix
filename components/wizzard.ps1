If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")){
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    Break
}

function Prompt-YesNo([string]$programname, [string]$optiontrue, [string]$optionfalse){
	clear
	$message  = "`n*** Install $programname ***`n"
	$question = "`nAre you sure you want to proceed?`n"
	$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
	$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList $optiontrue))
	$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList $optionfalse))
	$decision = $Host.UI.PromptForChoice($message, $question, $choices, 0)
	if ($decision -eq 0) {
		Write-Host "Installing $programname..."
		return $true
	}else{
		Write-Host "Skipping $programname"
		return $false
	}
}

if(Prompt-YesNo "Chocolatey" '&yes' '&no') {
	
	iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));pause

	if(Prompt-YesNo "Chocolatey GUI" '&yes' '&no')		{choco install -y chocolateygui;pause} else {pause}

	if(Prompt-YesNo "ccleaner" '&yes' '&no')			{choco install -y ccleaner;pause} else {pause}
	if(Prompt-YesNo "defraggler" '&yes' '&no')			{choco install -y defraggler;pause} else {pause}
	if(Prompt-YesNo "vlc" '&yes' '&no')					{choco install -y vlc;pause} else {pause}
	if(Prompt-YesNo "libreoffice" '&yes' '&no')			{choco install -y libreoffice;pause} else {pause}
	if(Prompt-YesNo "sublimetext3" '&yes' '&no')		{choco install -y sublimetext3;pause} else {pause}
	if(Prompt-YesNo "geforce-experience" '&yes' '&no')	{choco install -y geforce-experience;pause} else {pause}

	if(Prompt-YesNo "allbrowsers" '&yes' '&choose')		{choco install -y allbrowsers;pause}
	else{
		pause
		if(Prompt-YesNo "firefox" '&yes' '&no')				{choco install -y firefox;pause} else {pause}
		if(Prompt-YesNo "google-chrome-x64" '&yes' '&no')	{choco install -y google-chrome-x64;pause} else {pause}
	}
} else {pause}

if(Prompt-YesNo "Remove Windows Crapware (3d, bing, communi, people, phone, zune, xbox, onenote, MicrosoftOfficeHub, WindowsMaps)" '&yes' '&choose'){

	Get-AppxPackage *3d* | Remove-AppxPackage
	Get-AppxPackage *bing* | Remove-AppxPackage
	Get-AppxPackage *communi* | Remove-AppxPackage
	Get-AppxPackage *people* | Remove-AppxPackage
	Get-AppxPackage *phone* | Remove-AppxPackage
	Get-AppxPackage *zune* | Remove-AppxPackage
	Get-AppxPackage *xbox* | Remove-AppxPackage
	Get-AppxPackage *onenote* | Remove-AppxPackage
	Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage
	Get-AppxPackage *WindowsMaps* | Remove-AppxPackage
	pause
}
else {
	
	pause

	if(Prompt-YesNo "remove 3d package(s)" '&yes' '&no')					{Get-AppxPackage *3d* | Remove-AppxPackage;pause} else {pause}
	if(Prompt-YesNo "remove bing package(s)" '&yes' '&no')					{Get-AppxPackage *bing* | Remove-AppxPackage;pause} else {pause}
	if(Prompt-YesNo "remove communi package(s)" '&yes' '&no')				{Get-AppxPackage *communi* | Remove-AppxPackage;pause} else {pause}
	if(Prompt-YesNo "remove people package(s)" '&yes' '&no')				{Get-AppxPackage *people* | Remove-AppxPackage;pause} else {pause}
	if(Prompt-YesNo "remove phone package(s)" '&yes' '&no')					{Get-AppxPackage *phone* | Remove-AppxPackage;pause} else {pause}
	if(Prompt-YesNo "remove zune package(s)" '&yes' '&no')					{Get-AppxPackage *zune* | Remove-AppxPackage;pause} else {pause}
	if(Prompt-YesNo "remove xbox package(s)" '&yes' '&no')					{Get-AppxPackage *xbox* | Remove-AppxPackage;pause} else {pause}
	if(Prompt-YesNo "remove onenote package(s)" '&yes' '&no')				{Get-AppxPackage *onenote* | Remove-AppxPackage;pause} else {pause}
	if(Prompt-YesNo "remove MicrosoftOfficeHub package(s)" '&yes' '&no')	{Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage;pause} else {pause}
	if(Prompt-YesNo "remove WindowsMaps package(s)" '&yes' '&no')			{Get-AppxPackage *WindowsMaps* | Remove-AppxPackage;pause} else {pause}
}


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
