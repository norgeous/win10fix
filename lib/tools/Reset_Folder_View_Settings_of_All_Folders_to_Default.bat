@echo off

:: Created by: Shawn Brink
:: http://www.tenforums.com
:: Tutorial: http://www.tenforums.com/tutorials/17707-folder-view-settings-reset-default-windows-10-a.html 


:: To reset folder view settings of all folders
Reg Delete "HKCU\SOFTWARE\Microsoft\Windows\Shell\BagMRU" /F
Reg Delete "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags" /F

::notfound
::Reg Delete "HKCU\SOFTWARE\Microsoft\Windows\ShellNoRoam\Bags" /F
::notfound
::Reg Delete "HKCU\SOFTWARE\Microsoft\Windows\ShellNoRoam\BagMRU" /F

Reg Delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /F
Reg Delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /F

::notfound
::Reg Delete "HKCU\SOFTWARE\Classes\Wow6432Node\Local Settings\Software\Microsoft\Windows\Shell\Bags" /F
::notfound
::Reg Delete "HKCU\SOFTWARE\Classes\Wow6432Node\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /F


:: To reset size of details, navigation, preview panes to default
::notfound
::Reg Delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\Sizer" /F


