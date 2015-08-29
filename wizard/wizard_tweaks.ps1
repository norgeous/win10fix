Make-Page @{
	"text"="tweak1?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				DoAndDisplay @{
					"title"="tweak1...";
					"action"={
					}
				}
			}
			1{
				Write-Host "`n"
				Write-Host "Skipping tweak1"
			}
		}
	}
}