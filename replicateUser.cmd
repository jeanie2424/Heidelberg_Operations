::======================================::
::    Replicate Single User Account     ::
::       Author: Daniel Scroggins       ::
::         Year: 2015                   ::
::     Heidelberg Distributing Co.      ::
::======================================::

@echo off
set /p user=Please enter username: 
for /f "tokens=*" %%i in ('dsquery user -samid "%user%"') do set userdn=%%i
repadmin /replsingleobj * %userdn%
pause&exit

