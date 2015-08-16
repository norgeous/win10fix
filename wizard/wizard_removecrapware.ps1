#Make-Page @{
#	"text"="Install google-chrome-x64?";
#	"action"={
#		Switch(Prompt-Choice @('&Yes','&No')){
#			0{
#				DoAndDisplay @{
#					"title"="Installing google-chrome-x64...";
#					"action"={choco install -y google-chrome-x64}
#				}
#			}
#			1{
#				Write-Host "`n"
#				Write-Host "Skipping google-chrome-x64"
#			}
#		}
#	}
#}






# if(Prompt-YesNo "Remove Windows Crapware (3d, bing, communi, people, phone, zune, xbox, onenote, MicrosoftOfficeHub, WindowsMaps)" '&yes' '&choose'){
# 
# 	Get-AppxPackage *3d* | Remove-AppxPackage
# 	Get-AppxPackage *bing* | Remove-AppxPackage
# 	Get-AppxPackage *communi* | Remove-AppxPackage
# 	Get-AppxPackage *people* | Remove-AppxPackage
# 	Get-AppxPackage *phone* | Remove-AppxPackage
# 	Get-AppxPackage *zune* | Remove-AppxPackage
# 	Get-AppxPackage *xbox* | Remove-AppxPackage
# 	Get-AppxPackage *onenote* | Remove-AppxPackage
# 	Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage
# 	Get-AppxPackage *WindowsMaps* | Remove-AppxPackage
# 	pause
# }
# else {
# 	
# 	pause
# 
# 	if(Prompt-YesNo "remove 3d package(s)" '&yes' '&no')					{Get-AppxPackage *3d* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove bing package(s)" '&yes' '&no')					{Get-AppxPackage *bing* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove communi package(s)" '&yes' '&no')				{Get-AppxPackage *communi* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove people package(s)" '&yes' '&no')				{Get-AppxPackage *people* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove phone package(s)" '&yes' '&no')					{Get-AppxPackage *phone* | Remove-AppxPackage;pause} else {pause}
Write-Host "`n"
# 	if(Prompt-YesNo "remove zune package(s)" '&yes' '&no')					{Get-AppxPackage *zune* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove xbox package(s)" '&yes' '&no')					{Get-AppxPackage *xbox* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove onenote package(s)" '&yes' '&no')				{Get-AppxPackage *onenote* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove MicrosoftOfficeHub package(s)" '&yes' '&no')	{Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage;pause} else {pause}
# 	if(Prompt-YesNo "remove WindowsMaps package(s)" '&yes' '&no')			{Get-AppxPackage *WindowsMaps* | Remove-AppxPackage;pause} else {pause}
# }
# 

