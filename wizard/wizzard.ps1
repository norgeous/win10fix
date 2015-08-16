Write-Host "Starting..."

If(-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")){
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    Break
}

################################################################################################################################

function DoAndDisplay([array]$options){
	Write-Host "`n"
	Write-Host $options.title
	Write-Host "`n"
	& $options.action
	Write-Host "`n"
	Write-Host "completed!"
	Write-Host "`n"
}

function Prompt-Choice([array]$options){
	$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
	Foreach ($option in $options) {
		$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList $option))
	}
	return $Host.UI.PromptForChoice("", "", $choices, 0)
}

function Make-Page([array]$options){
	clear
	Write-Host "`n"
	#Write-Host "************************************************************************"
	#Write-Host "`n"
	Write-Host $options.text
	Write-Host "`n"
	#Write-Host "************************************************************************"
	#Write-Host "`n"
	& $options.action
	Write-Host "`n"
	pause

}

################################################################################################################################

Make-Page @{
	"text"="Intro text`n`nread the README.md for a full description`nPotentially harmfull script`nthis script can make perminant changes to your system`nuse CTRL+C to exit the wizzard at any time...`nselection is case insensative`n`nContinue the script?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				Write-Host "`n"
				Write-Host "The script will now continue..."
				Write-Host "Please read the options for each page carefully!"
			}
			1{
				Write-Host "EXIT HERE"
				Break
			}
		}
	}
}

Make-Page @{
	"text"="Install both Chocolatey and the GUI?";
	"action"={
		Switch(Prompt-Choice @('Install &Both','&Chocolatey only','&Neither')){
			0{
				DoAndDisplay @{
					"title"="Installing Chocolatey...";
					"action"={iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))}
				}
				DoAndDisplay @{
					"title"="Installing Chocolatey GUI...";
					"action"={choco install -y chocolateygui}
				}
			}
			1{
				DoAndDisplay @{
					"title"="Installing Chocolatey...";
					"action"={iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))}
				}
			}
			2{
				Write-Host "`n"
				Write-Host "Skipping Chocolatey"
			}
		}
	}
}

Make-Page @{
	"text"="Install ccleaner?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				DoAndDisplay @{
					"title"="Installing ccleaner...";
					"action"={choco install -y ccleaner}
				}
			}
			1{
				Write-Host "`n"
				Write-Host "Skipping ccleaner"
			}
		}
	}
}

Make-Page @{
	"text"="Install defraggler?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				DoAndDisplay @{
					"title"="Installing defraggler...";
					"action"={choco install -y defraggler}
				}
			}
			1{
				Write-Host "`n"
				Write-Host "Skipping defraggler"
			}
		}
	}
}

Make-Page @{
	"text"="Install vlc?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				DoAndDisplay @{
					"title"="Installing vlc...";
					"action"={choco install -y vlc}
				}
			}
			1{
				Write-Host "`n"
				Write-Host "Skipping vlc"
			}
		}
	}
}

Make-Page @{
	"text"="Install libreoffice?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				DoAndDisplay @{
					"title"="Installing libreoffice...";
					"action"={choco install -y libreoffice}
				}
			}
			1{
				Write-Host "`n"
				Write-Host "Skipping libreoffice"
			}
		}
	}
}

Make-Page @{
	"text"="Install sublimetext3?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				DoAndDisplay @{
					"title"="Installing sublimetext3...";
					"action"={choco install -y sublimetext3}
				}
			}
			1{
				Write-Host "`n"
				Write-Host "Skipping sublimetext3"
			}
		}
	}
}

Make-Page @{
	"text"="Install geforce-experience?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				DoAndDisplay @{
					"title"="Installing geforce-experience...";
					"action"={choco install -y geforce-experience}
				}
			}
			1{
				Write-Host "`n"
				Write-Host "Skipping geforce-experience"
			}
		}
	}
}

Make-Page @{
	"text"="Install allbrowsers?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				DoAndDisplay @{
					"title"="Installing allbrowsers...";
					"action"={choco install -y allbrowsers}
				}
			}
			1{
				Write-Host "`n"
				Write-Host "Skipping allbrowsers"
			}
		}
	}
}

Make-Page @{
	"text"="Install firefox?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				DoAndDisplay @{
					"title"="Installing firefox...";
					"action"={choco install -y firefox}
				}
			}
			1{
				Write-Host "`n"
				Write-Host "Skipping firefox"
			}
		}
	}
}

Make-Page @{
	"text"="Install google-chrome-x64?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				DoAndDisplay @{
					"title"="Installing google-chrome-x64...";
					"action"={choco install -y google-chrome-x64}
				}
			}
			1{
				Write-Host "`n"
				Write-Host "Skipping google-chrome-x64"
			}
		}
	}
}






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


################## ADD LATER
# choco install -y tightvnc sandboxie geforce-experience ccleaner defraggler vlc itunes libreoffice blender sysinternals procexp procmon
# choco install -y allbrowsers sublimetext3 filezilla nodejs putty github virtualbox autohotkey grepwin
# choco install -y adb
# :: choco install -y jdk7 android-sdk
# :: choco install -y kodi
# :: choco install -y phantomjs
# :: didnt work
# :: avirafreeantivirus glasswire steam skype 7zip winrar handbrake




clear
Write-Host "`n"
Write-Host "wizzard complete"
Write-Host "`n"
pause