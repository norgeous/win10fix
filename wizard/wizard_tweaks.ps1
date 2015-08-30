Make-Page @{
	"text"="tweak1?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				DoAndDisplay @{
					"title"="tweak1...";
					"action"={


						# Privacy: Let apps use my advertising ID: Disable
						Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 0
						
						# Privacy: SmartScreen Filter for Store Apps: Disable
						Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost -Name EnableWebContentEvaluation -Type DWord -Value 0

						# WiFi Sense: HotSpot Sharing: Disable
						Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Name value -Type DWord -Value 0

						# WiFi Sense: Shared HotSpot Auto-Connect: Disable
						Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots -Name value -Type DWord -Value 0

						# Start Menu: Disable Bing Search Results
						Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Type DWord -Value 0

						# Disable Telemetry (requires a reboot to take effect)
						Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type DWord -Value 0
						Get-Service DiagTrack,Dmwappushservice | Stop-Service | Set-Service -StartupType Disabled



						# Change Explorer home screen back to "This PC"
						Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1

						# Remove folder shortcuts from "This PC"
						regedit /s $PSScriptRoot\external\64-bit_Remove_All_user_Folders_in_This_PC.reg
						
						# Taskbar 'small icons'
						Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarSmallIcons -Type DWord -Value 1
						
						# Don't hide icons in tray
						Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name EnableAutoTray -Type DWord -Value 0
						
						# Dark Theme for Windows
						Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\ -Name AppsUseLightTheme -Type DWord -Value 0



						# Change Windows Updates to "Notify to schedule restart"
						Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name UxOption -Type DWord -Value 1

						# disable P2P windows update downloads completely:
						Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config -Name DODownloadMode -Type DWord -Value 0



						# Kill OneDrive
						cmd $PSScriptRoot\external\RemoveOneDrive.bat

						
					}
				}
			}
			1{
				Write-Host "`nSkipping tweak1`n"
			}
		}
	}
}