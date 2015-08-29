Make-Page @{
	"text"="tweak1?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				DoAndDisplay @{
					"title"="tweak1...";
					"action"={

						#Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 0
						
						Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\ -Name AppsUseLightTheme -Type DWord -Value 0
						Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarSmallIcons -Type DWord -Value 1
						Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name EnableAutoTray -Type DWord -Value 0
						
					}
				}
			}
			1{
				Write-Host "`nSkipping tweak1`n"
			}
		}
	}
}