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
				Write-Host "`nSkipping tweak1`n"
			}
		}
	}
}