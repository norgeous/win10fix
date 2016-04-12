@ECHO off

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command ""Write-Host; cup all -y; Write-Host; Start-Sleep -s 5""' -Verb RunAs}";