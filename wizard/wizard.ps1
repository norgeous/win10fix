Write-Host "Loading..."

. "$PSScriptRoot\check_admin.ps1"
. "$PSScriptRoot\display_functions.ps1"

$do_choco = $False
$do_crapware = $False
$do_folders = $False

Make-Page @{
	"text"="`
Intro text and title`n`
`n`
read the README.md for a full description`n`
Potentially harmfull script`n`
this script can make perminant changes to your system`n`
use CTRL+C to exit the wizard at any time...`n`
selection is NOT case-sensative`n`
`n`
Continue the script?`
";
	"action"={
		Switch(Prompt-Choice @('&Everything','&Chocolatey only','&Remove crapware only','&Folders only','&Exit')){
			0{
				$do_choco = $True
				$do_crapware = $True
				$do_folders = $True
			}
			1{
				$do_choco = $True
			}
			2{
				$do_crapware = $True
			}
			3{
				$do_folders = $True
			}
			4{
				#exit
			}
		}
	}
}

If($do_choco -eq $True)		{. "$PSScriptRoot\wizard_chocolatey.ps1"}
If($do_crapware -eq $True)	{. "$PSScriptRoot\wizard_removecrapware.ps1"}
#If($do_folders -eq $True)	{. "$PSScriptRoot\wizard_folders.ps1"}

Make-Page @{
	"text"="Wizard complete!`n`nPress Enter to Exit...";
	"action"={}
}