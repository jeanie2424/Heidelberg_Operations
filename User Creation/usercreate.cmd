@echo off
::==============================================::
::	      User Creation Script              ::
::                                              ::
::         Author: Daniel Scroggins             ::
::           Year: 2015                         ::
::        Heidelberg Distributing               ::
::==============================================::


::User OUs::
set cinci=OU=Users,OU=Cincinnati,DC=Heidelberg,DC=local
set clev=OU=Users,OU=Cleveland,DC=Heidelberg,DC=local
set cbus=OU=Users,OU=Columbus,DC=Heidelberg,DC=local
set day=OU=Users,OU=Dayton,DC=Heidelberg,DC=local
set heb=OU=Users,OU=Hebron,DC=Heidelberg,DC=local
set ken=OU=Users,OU=Kenner,DC=Heidelberg,DC=local
set lor=OU=Users,OU=Lorain,DC=Heidelberg,DC=local
set ov=OU=Users,OU=Ohio Valley,DC=Heidelberg,DC=local
set tol=OU=Users,OU=Toledo,DC=Heidelberg,DC=local

echo Please select Office Location
echo =============================
echo 1 Kentucky
echo 2 Cincinnati
echo 3 Ohio Valley
echo 4 Dayton
echo 5 Columbus
echo 6 Toledo
echo 7 Lorain
echo 8 Cleveland
echo 9 Youngstown
set /p offnum=Enter number to set office: 

if %offnum% EQU 1 set office=Kentucky Heidelberg && set add=

rem set /p firstn=Enter First Name: 
rem set /p lastn=Enter Last Name: 
rem set /p city=Enter City:  


:password
set /p pswd=Enter Password: 
set /p pswdcomf=Please comfirm Password: 

if %pswd% EQU %pswdcomf% (
goto :usercreate
) else (
echo PASSWORDS DO NOT MATCH PLEASE TRY AGAIN
goto :password
)







:usercreate
