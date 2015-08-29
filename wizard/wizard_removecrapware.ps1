Make-Page @{
	"text"="Remove Windows Crapware (3d, bing, candycrush, people, phone, photo, zune, xbox, onenote, twitter, SkypeApp, MicrosoftSolitaireCollection, MicrosoftOfficeHub, CloudExperienceHost, windowscommunicationsapps, WindowsMaps)?";
	"action"={
		Switch(Prompt-Choice @('&All','&Choose','&No')){
			0{
				DoAndDisplay @{
					"title"="Removing all Crapware...";
					"action"={

						Get-AppxPackage *candycrush* | Remove-AppxPackage
						Get-AppxPackage *twitter* | Remove-AppxPackage

						Get-AppxPackage *3DBuilder* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.3DBuilder_2015.720.2336.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *Appconnector* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Appconnector_2015.707.550.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *Bing* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingFinance_10004.3.193.0_neutral_~_8wekyb3d8bbwe
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingNews_10004.3.193.0_neutral_~_8wekyb3d8bbwe
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingSports_10004.3.193.0_neutral_~_8wekyb3d8bbwe
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingWeather_10004.3.193.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *Getstarted* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Getstarted_2015.622.1108.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftOfficeHub_2015.4218.23751.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftSolitaireCollection_2015.804.1646.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *OneNote* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Office.OneNote_2015.4201.10091.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *People* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.People_2015.715.0.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *SkypeApp* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.SkypeApp_3.2.1.0_neutral_~_kzf8qxf38zg5c
						
						Get-AppxPackage *Windows.Photos* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Windows.Photos_2015.618.1921.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *WindowsCamera* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsCamera_2015.612.1501.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage #Mail/Calendar
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:microsoft.windowscommunicationsapps_2015.6002.42251.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *WindowsMaps* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsMaps_2015.619.213.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *WindowsPhone* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsPhone_2015.620.10.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsSoundRecorder_2015.615.1606.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *WindowsStore* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsStore_2015.701.14.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *XboxApp* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxApp_2015.617.130.0_neutral_~_8wekyb3d8bbwe
						
						Get-AppxPackage *Zune* | Remove-AppxPackage
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneMusic_2019.6.10841.0_neutral_~_8wekyb3d8bbwe
						DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneVideo_2019.6.10811.0_neutral_~_8wekyb3d8bbwe

						
						Get-AppxPackage | Select Name, PackageFullName
						DISM /Online /Get-ProvisionedAppxPackages | select-string Packagename

						pause

					}
				}
			}
			1{
				Write-Host "`n"
				Write-Host "Choose..."
				Write-Host "UNIMPLIMENTED"
				pause
			}
			2{
				Write-Host "`n"
				Write-Host "Skipping Crapware"
			}
		}
	}
}