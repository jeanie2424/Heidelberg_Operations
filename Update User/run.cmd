@echo off
powershell -noprofile Set-ExecutionPolicy Unrestricted
powershell -nologo -file update_user.ps1
pause