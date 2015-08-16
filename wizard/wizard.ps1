Write-Host "Starting..."
. "$PSScriptRoot\check_admin.ps1"
. "$PSScriptRoot\display_functions.ps1"

Make-Page @{
	"text"="Intro text`n`nread the README.md for a full description`nPotentially harmfull script`nthis script can make perminant changes to your system`nuse CTRL+C to exit the wizard at any time...`nselection is case insensative`n`nContinue the script?";
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

# run other wizards here

Make-Page @{
	"text"="Wizard complete!";
	"action"={pause}
}