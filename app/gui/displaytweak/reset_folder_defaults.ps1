#.\\Reset_Folder_View_Settings_of_All_Folders_to_Default.bat
Write-Host "Set Folder View Settings to Default (All Folders)"
$keys = @(
  "HKCU:\SOFTWARE\Microsoft\Windows\Shell\BagMRU",                                             # To reset folder view settings of all folders
  "HKCU:\SOFTWARE\Microsoft\Windows\Shell\Bags",                                               # To reset folder view settings of all folders
  "HKCU:\SOFTWARE\Microsoft\Windows\ShellNoRoam\Bags",
  "HKCU:\SOFTWARE\Microsoft\Windows\ShellNoRoam\BagMRU",
  "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU",
  "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags",
  "HKCU:\SOFTWARE\Classes\Wow6432Node\Local Settings\Software\Microsoft\Windows\Shell\Bags",
  "HKCU:\SOFTWARE\Classes\Wow6432Node\Local Settings\Software\Microsoft\Windows\Shell\BagMRU",
  "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\Sizer"      # To reset size of details, navigation, preview panes to default
)
Foreach ($key in $keys)
{
  $pathkey = "$path$key"
  if (Get-Item "$pathkey" -ErrorAction SilentlyContinue) {
    Remove-Item "$pathkey" -Recurse
    Write-Host " $pathkey - deleted"
  } else {
    #New-Item -Path "$pathkey" | Out-Null # create key
    Write-Host " $pathkey - not found"
  }
}
