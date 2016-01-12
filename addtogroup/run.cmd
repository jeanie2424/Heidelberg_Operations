@echo off
powershell -noprofile Set-ExecutionPolicy Unrestricted
powershell -nologo -file addtogroup.ps1
pause