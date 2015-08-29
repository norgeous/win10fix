Make-Page @{
	"text"="Tweak 1?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				DoAndDisplay @{
					"title"="Removing all Crapware...";
					"action"={
					}
				}
			}
			2{
				Write-Host "`n"
				Write-Host "Skipping Crapware"
			}
		}
	}
}