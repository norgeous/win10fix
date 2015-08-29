Write-Host "Loading..."

. "$PSScriptRoot\check_admin.ps1"
. "$PSScriptRoot\display_functions.ps1"

				$do_choco = $FALSE
				$do_crapware = $FALSE
				$do_folders = $FALSE

Make-Page @{
	"text"="`
Intro text and title`n`
`n`
read the README.md for a full description`n`
Potentially harmfull script`n`
this script can make perminant changes to your system`n`
use CTRL+C to exit the wizard at any time...`n`
selection is NOT case-sensative`n`
Chocolatey aids the install of: ccleaner, defraggler, vlc, libreoffice, sublimetext3, geforce-experience, allbrowsers, firefox, google-chrome-x64`n`
`n`
Continue the script?`
";
	"action"={
		Switch(Prompt-Choice @('&Everything','&Chocolatey only','&Remove crapware only','&Tweaks only','&Exit')){
			0{
				. "$PSScriptRoot\wizard_chocolatey.ps1"
				. "$PSScriptRoot\wizard_removecrapware.ps1"
				. "$PSScriptRoot\wizard_tweaks.ps1"
			}
			1{
				. "$PSScriptRoot\wizard_chocolatey.ps1"
			}
			2{
				. "$PSScriptRoot\wizard_removecrapware.ps1"
			}
			3{
				. "$PSScriptRoot\wizard_tweaks.ps1"
			}
			4{
			}
		}
	}
}

Make-Page @{
	"text"="Wizard complete!`n`nPress Enter to Exit...";
	"action"={pause}
}