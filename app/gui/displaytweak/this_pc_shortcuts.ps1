#regedit /s $pwd\64-bit_Remove_All_user_Folders_in_This_PC.reg
Write-Host "Removing 'Folders' shortcuts from 'This PC'"
$paths = @(
  "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\",
  "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\"
)
$keys = @(
  "{1CF1260C-4DD0-4ebb-811F-33C572699FDE}", # Music
  "{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}", # Music
  "{374DE290-123F-4565-9164-39C4925E467B}", # Downloads
  "{088e3905-0323-4b02-9826-5d99428e115f}", # Downloads
  "{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}", # Pictures
  "{24ad3ad4-a569-4530-98e1-ab02f9417aa8}", # Pictures
  "{A0953C92-50DC-43bf-BE83-3742FED03C9C}", # Videos
  "{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}", # Videos
  "{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}", # Documents
  "{d3162b92-9365-467a-956b-92703aca08af}", # Documents
  "{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}", # 3D Objects
  "{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}"  # Desktop
)
Foreach ($path in $paths)
{
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
}
