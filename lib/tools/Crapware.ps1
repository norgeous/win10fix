Get-AppxPackage *candycrush* | Remove-AppxPackage
Get-AppxPackage *twitter* | Remove-AppxPackage

Get-AppxPackage *3DBuilder* | Remove-AppxPackage
Get-AppxPackage *Appconnector* | Remove-AppxPackage
Get-AppxPackage *Bing* | Remove-AppxPackage
Get-AppxPackage *Getstarted* | Remove-AppxPackage
Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage
Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage
Get-AppxPackage *OneNote* | Remove-AppxPackage
Get-AppxPackage *People* | Remove-AppxPackage
Get-AppxPackage *SkypeApp* | Remove-AppxPackage
Get-AppxPackage *Windows.Photos* | Remove-AppxPackage
Get-AppxPackage *WindowsCamera* | Remove-AppxPackage
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage #Mail/Calendar
Get-AppxPackage *WindowsMaps* | Remove-AppxPackage
Get-AppxPackage *WindowsPhone* | Remove-AppxPackage
Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage
Get-AppxPackage *WindowsStore* | Remove-AppxPackage
Get-AppxPackage *XboxApp* | Remove-AppxPackage
Get-AppxPackage *Zune* | Remove-AppxPackage

DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.3DBuilder_2015.720.2336.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Appconnector_2015.707.550.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingFinance_10004.3.193.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingNews_10004.3.193.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingSports_10004.3.193.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingWeather_10004.3.193.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Getstarted_2015.622.1108.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftOfficeHub_2015.4218.23751.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftSolitaireCollection_2015.804.1646.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Office.OneNote_2015.4201.10091.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.People_2015.715.0.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Windows.Photos_2015.618.1921.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsCamera_2015.612.1501.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:microsoft.windowscommunicationsapps_2015.6002.42251.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsMaps_2015.619.213.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsPhone_2015.620.10.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsSoundRecorder_2015.615.1606.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsStore_2015.701.14.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxApp_2015.617.130.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneMusic_2019.6.10841.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneVideo_2019.6.10811.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.SkypeApp_3.2.1.0_neutral_~_kzf8qxf38zg5c

Get-AppxPackage *VCLibs* | Remove-AppxPackage

DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.VCLibs.140.00_14.0.22929.0_x86__8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.VCLibs.140.00_14.0.22929.0_x64__8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.VCLibs.110.00_11.0.51106.1_x86__8wekyb3d8bbwe

#Get-AppxPackage | Select Name, PackageFullName
#DISM /Online /Get-ProvisionedAppxPackages | select-string Packagename
