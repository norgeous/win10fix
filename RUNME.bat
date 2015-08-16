@ECHO OFF
SET dirpath=%~dp0
SET ps1script=%dirpath%wizard\wizard.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%ps1script%""' -Verb RunAs}";