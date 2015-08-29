Make-Page @{
	"text"="Remove Windows Crapware (3d, bing, communi, people, phone, zune, xbox, onenote, MicrosoftOfficeHub, WindowsMaps)?";
	"action"={
		Switch(Prompt-Choice @('&All','&Choose','&No')){
			0{
				DoAndDisplay @{
					"title"="Removing all Crapware...";
					"action"={
						Get-AppxPackage *3d* | Remove-AppxPackage
						Get-AppxPackage *bing* | Remove-AppxPackage
						Get-AppxPackage *candycrush* | Remove-AppxPackage
						Get-AppxPackage *people* | Remove-AppxPackage
						Get-AppxPackage *phone* | Remove-AppxPackage
						Get-AppxPackage *photo* | Remove-AppxPackage
						Get-AppxPackage *zune* | Remove-AppxPackage
						Get-AppxPackage *xbox* | Remove-AppxPackage
						Get-AppxPackage *onenote* | Remove-AppxPackage
						Get-AppxPackage *twitter* | Remove-AppxPackage
						Get-AppxPackage *SkypeApp* | Remove-AppxPackage
						Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage
						Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage
						Get-AppxPackage *CloudExperienceHost* | Remove-AppxPackage
						Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
						Get-AppxPackage *WindowsMaps* | Remove-AppxPackage
					}
				}
			}
			1{
				Write-Host "`n"
				Write-Host "Choose..."
			}
			2{
				Write-Host "`n"
				Write-Host "Skipping Crapware"
			}
		}
	}
}