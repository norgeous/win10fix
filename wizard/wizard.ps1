Write-Host "Loading..."

. "$PSScriptRoot\check_admin.ps1"
. "$PSScriptRoot\display_functions.ps1"

Make-Page @{
	"text"="`
Intro text and title`n`
`n`
read the README.md for a full description`n`
Potentially harmfull script`n`
this script can make perminant changes to your system`n`
use CTRL+C to exit the wizard at any time...`n`
selection is case insensative`n`
`n`
Continue the script?`
";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				Write-Host "`n"
				Write-Host "The script will now continue..."
				Write-Host "`n"
				Write-Host "Please read the options for each page carefully!"
			}
			1{
				Write-Host "EXIT HERE"
				Break
				Exit
				#how?
			}
		}
	}
}

. "$PSScriptRoot\wizard_chocolatey.ps1"
. "$PSScriptRoot\wizard_removecrapware.ps1"

Make-Page @{
	"text"="Wizard complete!`n`nPress Enter to Exit...";
	"action"={}
}