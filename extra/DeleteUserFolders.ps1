$user = [Environment]::UserName

Write-Host
Write-Host "delete folders from your user folder?"
Write-Host "C:\Users\$user\Contacts"
Write-Host "C:\Users\$user\Favourites"
Write-Host "C:\Users\$user\Links"
Write-Host "C:\Users\$user\Music"
Write-Host "C:\Users\$user\Pictures"
Write-Host "C:\Users\$user\Saved Games"
Write-Host "C:\Users\$user\Searches"
Write-Host "C:\Users\$user\Videos"

Write-Host
Write-Host "Are you sure? CANT BE UNDONE"
Write-Host
PAUSE

Remove-Item -Recurse -Force "C:\Users\$user\Contacts"
Remove-Item -Recurse -Force "C:\Users\$user\Favourites"
Remove-Item -Recurse -Force "C:\Users\$user\Links"
Remove-Item -Recurse -Force "C:\Users\$user\Music"
Remove-Item -Recurse -Force "C:\Users\$user\Pictures"
Remove-Item -Recurse -Force "C:\Users\$user\Saved Games"
Remove-Item -Recurse -Force "C:\Users\$user\Searches"
Remove-Item -Recurse -Force "C:\Users\$user\Videos"
