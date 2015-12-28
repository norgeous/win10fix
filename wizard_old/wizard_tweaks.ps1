Make-Page @{
    "text"="apply tweaks?";
    "action"={
        Switch(Prompt-Choice @('&Yes','&Choose','&No')){
            0{
                DoAndDisplay @{
                    "title"="apply tweaks...";
                    "action"={

                        # Kill OneDrive
                        Start-Process "cmd.exe" "/c $PSScriptRoot\external\RemoveOneDrive.bat"


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


                        # Change Explorer home screen back to 'This PC'
                        Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1

                        # Remove folder shortcuts from 'This PC'
                        regedit /s $PSScriptRoot\external\64-bit_Remove_All_user_Folders_in_This_PC.reg
                        
                        # Taskbar tray use 'small icons'
                        Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarSmallIcons -Type DWord -Value 1
                        
                        # Don't hide icons in tray
                        Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name EnableAutoTray -Type DWord -Value 0
                        
                        # Don't hide file extensions
                        Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -Type DWord -Value 0

                        # Don't hide hidden files
                        Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Hidden -Type DWord -Value 1

                        # Dark Theme for Windows
                        Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\ -Name AppsUseLightTheme -Type DWord -Value 0

                        # Change Windows Updates to 'Notify to schedule restart'
                        Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name UxOption -Type DWord -Value 1

                        # disable P2P windows update downloads completely
                        Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config -Name DODownloadMode -Type DWord -Value 0

                        # delete folders from user folder; Contacts, Favourites, Music, Pictures, Saved Games, Searches, Videos
                        $user = [Environment]::UserName
                        Remove-Item -Recurse -Force "C:\Users\$user\Contacts"
                        Remove-Item -Recurse -Force "C:\Users\$user\Favourites"
                        Remove-Item -Recurse -Force "C:\Users\$user\Music"
                        Remove-Item -Recurse -Force "C:\Users\$user\Pictures"
                        Remove-Item -Recurse -Force "C:\Users\$user\Saved Games"
                        Remove-Item -Recurse -Force "C:\Users\$user\Searches"
                        Remove-Item -Recurse -Force "C:\Users\$user\Videos"

                    }
                }
            }
            1{
                
                Write-Host "`nChoose tweaks one-by-one...`n"

                Make-Page @{
                    "text"="Remove OneDrive?";
                    "action"={
                        Switch(Prompt-Choice @('&Yes','&No')){
                            0{
                                DoAndDisplay @{
                                    "title"="Removing OneDrive...";
                                    "action"={
                                        # Kill OneDrive
                                        Start-Process "cmd.exe" "/c $PSScriptRoot\external\RemoveOneDrive.bat"
                                    }
                                }
                            }
                            1{
                                Write-Host "`nSkipping Remove OneDrive`n"
                            }
                        }
                    }
                }

                Make-Page @{
                    "text"="Privacy tweaks?";
                    "action"={
                        Switch(Prompt-Choice @('&Yes','&No')){
                            0{
                                DoAndDisplay @{
                                    "title"="Removing OneDrive...";
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
                                    }
                                }
                            }
                            1{
                                Write-Host "`nSkipping Privacy tweaks`n"
                            }
                        }
                    }
                }

                Make-Page @{
                    "text"="Change Explorer home screen back to 'This PC'?";
                    "action"={
                        Switch(Prompt-Choice @('&Yes','&No')){
                            0{
                                DoAndDisplay @{
                                    "title"="Removing OneDrive...";
                                    "action"={
                                        # Change Explorer home screen back to 'This PC'
                                        Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1
                                    }
                                }
                            }
                            1{
                                Write-Host "`nSkipping Change Explorer home screen back to 'This PC'`n"
                            }
                        }
                    }
                }

                Make-Page @{
                    "text"="Change Explorer home screen back to 'This PC'?";
                    "action"={
                        Switch(Prompt-Choice @('&Yes','&No')){
                            0{
                                DoAndDisplay @{
                                    "title"="Change Explorer home screen back to 'This PC'...";
                                    "action"={
                                        # Change Explorer home screen back to 'This PC'
                                        Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1
                                    }
                                }
                            }
                            1{
                                Write-Host "`nSkipping Change Explorer home screen back to 'This PC'`n"
                            }
                        }
                    }
                }

                Make-Page @{
                    "text"="Remove folder shortcuts from 'This PC'?";
                    "action"={
                        Switch(Prompt-Choice @('&Yes','&No')){
                            0{
                                DoAndDisplay @{
                                    "title"="Remove folder shortcuts from 'This PC'...";
                                    "action"={
                                        # Remove folder shortcuts from 'This PC'
                                        regedit /s $PSScriptRoot\external\64-bit_Remove_All_user_Folders_in_This_PC.reg
                                    }
                                }
                            }
                            1{
                                Write-Host "`nSkipping Remove folder shortcuts from 'This PC'`n"
                            }
                        }
                    }
                }

                Make-Page @{
                    "text"="Taskbar tray use 'small icons'?";
                    "action"={
                        Switch(Prompt-Choice @('&Yes','&No')){
                            0{
                                DoAndDisplay @{
                                    "title"="Taskbar tray use 'small icons'...";
                                    "action"={
                                        # Taskbar tray use 'small icons'
                                        Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarSmallIcons -Type DWord -Value 1
                                    }
                                }
                            }
                            1{
                                Write-Host "`nSkipping Taskbar tray use 'small icons'`n"
                            }
                        }
                    }
                }

                Make-Page @{
                    "text"="Don't hide icons in tray?";
                    "action"={
                        Switch(Prompt-Choice @('&Yes','&No')){
                            0{
                                DoAndDisplay @{
                                    "title"="Don't hide icons in tray...";
                                    "action"={
                                        # Don't hide icons in tray
                                        Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name EnableAutoTray -Type DWord -Value 0
                                    }
                                }
                            }
                            1{
                                Write-Host "`nSkipping Don't hide icons in tray`n"
                            }
                        }
                    }
                }

                Make-Page @{
                    "text"="Don't hide file extensions?";
                    "action"={
                        Switch(Prompt-Choice @('&Yes','&No')){
                            0{
                                DoAndDisplay @{
                                    "title"="Don't hide file extensions...";
                                    "action"={
                                        # Don't hide file extensions
                                        Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -Type DWord -Value 0
                                    }
                                }
                            }
                            1{
                                Write-Host "`nSkipping Don't hide file extensions`n"
                            }
                        }
                    }
                }

                Make-Page @{
                    "text"="Don't hide hidden files?";
                    "action"={
                        Switch(Prompt-Choice @('&Yes','&No')){
                            0{
                                DoAndDisplay @{
                                    "title"="Don't hide hidden files...";
                                    "action"={
                                        # Don't hide hidden files
                                        Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Hidden -Type DWord -Value 1
                                    }
                                }
                            }
                            1{
                                Write-Host "`nSkipping Don't hide hidden files`n"
                            }
                        }
                    }
                }

                Make-Page @{
                    "text"="Dark Theme for Windows?";
                    "action"={
                        Switch(Prompt-Choice @('&Yes','&No')){
                            0{
                                DoAndDisplay @{
                                    "title"="Dark Theme for Windows...";
                                    "action"={
                                        # Dark Theme for Windows
                                        Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\ -Name AppsUseLightTheme -Type DWord -Value 0
                                    }
                                }
                            }
                            1{
                                Write-Host "`nSkipping Dark Theme for Windows`n"
                            }
                        }
                    }
                }

                Make-Page @{
                    "text"="Change Windows Updates to 'Notify to schedule restart'?";
                    "action"={
                        Switch(Prompt-Choice @('&Yes','&No')){
                            0{
                                DoAndDisplay @{
                                    "title"="Change Windows Updates to 'Notify to schedule restart'...";
                                    "action"={
                                        # Change Windows Updates to 'Notify to schedule restart'
                                        Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name UxOption -Type DWord -Value 1
                                    }
                                }
                            }
                            1{
                                Write-Host "`nSkipping Change Windows Updates to 'Notify to schedule restart'`n"
                            }
                        }
                    }
                }

                Make-Page @{
                    "text"="disable P2P windows update downloads completely?";
                    "action"={
                        Switch(Prompt-Choice @('&Yes','&No')){
                            0{
                                DoAndDisplay @{
                                    "title"="disable P2P windows update downloads completely...";
                                    "action"={
                                        # disable P2P windows update downloads completely
                                        Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config -Name DODownloadMode -Type DWord -Value 0
                                    }
                                }
                            }
                            1{
                                Write-Host "`nSkipping disable P2P windows update downloads completely`n"
                            }
                        }
                    }
                }

                Make-Page @{
                    "text"="delete folders from user folder; Contacts, Favourites, Music, Pictures, Saved Games, Searches, Videos?";
                    "action"={
                        Switch(Prompt-Choice @('&Yes','&No')){
                            0{
                                DoAndDisplay @{
                                    "title"="delete folders from user folder; Contacts, Favourites, Music, Pictures, Saved Games, Searches, Videos...";
                                    "action"={
                                        # delete folders from user folder; Contacts, Favourites, Music, Pictures, Saved Games, Searches, Videos
                                        $user = [Environment]::UserName
                                        Remove-Item -Recurse -Force "C:\Users\$user\Contacts"
                                        Remove-Item -Recurse -Force "C:\Users\$user\Favourites"
                                        Remove-Item -Recurse -Force "C:\Users\$user\Music"
                                        Remove-Item -Recurse -Force "C:\Users\$user\Pictures"
                                        Remove-Item -Recurse -Force "C:\Users\$user\Saved Games"
                                        Remove-Item -Recurse -Force "C:\Users\$user\Searches"
                                        Remove-Item -Recurse -Force "C:\Users\$user\Videos"
                                    }
                                }
                            }
                            1{
                                Write-Host "`nSkipping delete folders from user folder; Contacts, Favourites, Music, Pictures, Saved Games, Searches, Videos`n"
                            }
                        }
                    }
                }
            }
            2{
                Write-Host "`nSkipping tweaks`n"
            }
        }
    }
}