@ECHO OFF
SET dirpath=%~dp0
SET bat2ps1=%dirpath%wizard\bat2ps1.bat
SET ps1script=%dirpath%wizard\wizard.ps1
call %bat2ps1% %ps1script%