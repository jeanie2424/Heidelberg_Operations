#==========================================#
#           User Creation Script           #
#                                          #
#       Author: Daniel Scroggins           #
#         Year: 2015                       #
#        Heidelberg Distributing           #
#==========================================#

#User OUs##############################################
$cinci="OU=Users,OU=Cincinnati,DC=Heidelberg,DC=local"
$clev="OU=Users,OU=Cleveland,DC=Heidelberg,DC=local"
$cbus="OU=Users,OU=Columbus,DC=Heidelberg,DC=local"
$day="OU=Users,OU=Dayton,DC=Heidelberg,DC=local"
$heb="OU=Users,OU=Hebron,DC=Heidelberg,DC=local"
$ken="OU=Users,OU=Kenner,DC=Heidelberg,DC=local"
$lor="OU=Users,OU=Lorain,DC=Heidelberg,DC=local"
$ov="OU=Users,OU=Ohio Valley,DC=Heidelberg,DC=local"
$tol="OU=Users,OU=Toledo,DC=Heidelberg,DC=local"
#######################################################


#Prompts User for First & Last Name, Job Title, and Department

function ffunc{
return Read-Host 'Enter first name'
}

function lfunc{
return Read-Host 'Enter last name'
}

function jfunc{
return Read-Host 'Enter Job Title'
}

function dfunc{
return Read-Host 'Enter Department'
}

function mfunc{
return Read-Host 'Enter Manager Name'
}

function pfunc{
$paswd0 = Read-Host 'Enter Password for User'
$paswd1 = Read-Host 'Confirm Password'
$paswd2 = ConvertTo-SecureString $paswd1 -AsPlainText -Force
if ($paswd0 -eq $paswd1) {$paswd = $paswd2} else {Write-Host "Passwords do not match"; pfunc}
return $paswd
}

$fname = ffunc
$lname = lfunc
$jobtitle = jfunc
$dep = dfunc
$mgr = mfunc
$paswd = pfunc


#Prompts User for inputing the Company

function cfunc {
Write-Host
Write-Host
Write-Host "Please Select Company"
Write-Host 
Write-Host "1 for Heidelberg Distributing"
Write-Host "2 for Ohio Valley Wine & Beer"
Write-Host "3 for Rampant Brands"
Write-Host "4 for Wine Trends"
$comp = Read-Host 'Enter Company'


#Logic for Company selection

if ($comp -EQ 1) {$compu = "Heidelberg Distributing"; $email=$fname + "." + $lname + "@HeidelbergDistributing.com"}
elseif ($comp -eq 2) {$compu = "Ohio Valley Wine & Beer"; $email=$fname + "." + $lname + "@OVWineBeer.com"}
elseif ($comp -eq 3) {$compu = "Rampant Brands"; $email=$fname + "." + $lname + "@RampantBrands.com"}
elseif ($comp -eq 4) {$compu = "Wine Trends"; $email=$fname + "." + $lname + "@WineTrends.com"}
return $compu,$email
}
$compu,$email = cfunc


#Blank spaces

Write-Host
Write-Host


#Prompts User for inputing the Office

function ofunc {
Write-Host
Write-Host
Write-Host "Please Select Office"
Write-Host
Write-Host "1 for Cincinnati"
Write-Host "2 for Cleveland"
Write-Host "3 for Columbus"
Write-Host "4 for Dayton"
Write-Host "5 for Kentucky"
Write-Host "6 for Lorain"
Write-Host "7 for Ohio Valley"
Write-Host "8 for Toledo"
Write-Host "9 for Youngstown"
$office = Read-Host 'Enter office'


#Logic for office selection

if ($office -EQ 1) {$offname = "Cincinnati Heidelberg"; $offstreet = "1518 Dalton Avenue"; $offcity = "Cincinnati"; $offstate = "OH"; $offzip = "45214"; $path = $cinci}
elseif ($office -EQ 2) {$offname = "Cleveland Heidelberg"; $offstreet = "9101 E Pleasant Valley Road"; $offcity = "Independence"; $offstate = "OH"; $offzip = "44131"; $path = $clev}
elseif ($office -EQ 3) {$offname = "Columbus Heidelberg"; $offstreet = "3801 Parkwest Drive"; $offcity = "Columbus"; $offstate = "OH"; $offzip = "43228"; $path = $cbus}
elseif ($office -EQ 4) {$offname = "Dayton Heidelberg"; $offstreet = "3601 Dryden Road"; $offcity = "Moraine"; $offstate = "OH"; $offzip = "45439"; $path = $day}
elseif ($office -EQ 5) {$offname = "Kentucky Heidelberg"; $offstreet = "2245 Progress Drive"; $offcity = "Hebron"; $offstate = "KY"; $offzip = "41048"; $path = $heb}
elseif ($office -EQ 6) {$offname = "Lorain Heidelberg"; $offstreet = "5901 Baumhart Road"; $offcity = "Lorain"; $offstate = "OH"; $offzip = "44053"; $path = $lor}
elseif ($office -EQ 7) {$offname = "Ohio Valley Wine and Beer"; $offstreet = "10975 Medallion Drive"; $offcity = "Evendale"; $offstate = "OH"; $offzip = "45412"; $path = $ov}
elseif ($office -EQ 8) {$offname = "Toledo Heidelberg"; $offstreet = "912 Third Street"; $offcity = "Perrysburg"; $offstate = "OH"; $offzip = "43551"; $path = $tol}
elseif ($office -EQ 9) {$offname = "Youngstown Heidelberg"; $offstreet = "1265 Crescent Street"; $offcity = "Youngstown"; $offstate = "OH"; $offzip = "44502"; $path = $clev}
return $offname,$offstreet,$offcity,$offstate,$offzip,$path
}
$offname,$offstreet,$offcity,$offstate,$offzip,$path = ofunc


#Display data for user confirmation

function anscorf {
Write-Host
Write-Host
Write-Host "    Display Name: "$fname $lname
Write-Host "       Job Title: "$jobtitle
Write-Host "      Department: "$dep
Write-Host "         Company: "$compu
Write-Host "     Manger Name: "$mgr
Write-Host "           Email: "$email
Write-Host "          Office: "$offname
Write-Host "          Street: "$offstreet
Write-Host "City, State, Zip: "$offcity"," $offstate $offzip
Write-Host
$ans = Read-Host 'Is this information correct? y or n'

Write-Host
Write-Host


#Logic for information correction

if ($ans -eq "n") {
Write-Host "Enter Selection 1 - 7"
Write-Host "1 for first name"
Write-Host "2 for last name"
Write-Host "3 for job title"
Write-Host "4 for department"
Write-Host "5 for company"
Write-Host "6 for office"
Write-Host "7 for Manager Name"
Write-Host
Write-Host "NOTE: Street, City and Zip are determined by the office selection"
Write-Host "      Company will determine e-mail address and name of company"
Write-Host
$anscor = Read-Host 'Selection'
if ($anscor -eq 1) {$fname = ffunc}
elseif ($anscor -eq 2) {$lname = lfunc}
elseif ($anscor -eq 3) {$jobtitle = jfunc}
elseif ($anscor -eq 4) {$dep = dfunc}
elseif ($anscor -eq 5) {$compu,$email = cfunc}
elseif ($anscor -eq 6) {$offname,$offstreet,$offcity,$offstate,$offzip,$path = ofunc}
elseif ($anscor -eq 7) {$mgr = mfunc}
anscorf
} else {
Write-Host "**********************************************************"
Write-Host "*                                                        *"
Write-Host "*  User will now be created in Heidelberg.local domain   *"
Write-Host "*                                                        *"
Write-Host "**********************************************************"                    
Import-Module ActiveDirectory
new-aduser `
-Name "$fname $lname" `
-DisplayName "$fname $lname" `
-SamAccountName "$fname $lname" `
-Company "$compu" `
-StreetAddress "$offstreet" `
-Department "$dep" `
-Title "$jobtitle" `
-UserPrincipalName "$fname $lname@Heidelberg.local" `
-PostalCode $offzip `
-State $offstate `
-EmailAddress "$email" `
-GivenName $fname `
-City $offcity `
-Surname $lname `
-ChangePasswordAtLogon $false `
-Enabled $true `
-Manager "$mgr" `
-Path "$path" `
-Country "US" `
-Office "$offname" `
-AccountPassword ($paswd)
Write-Host
Write-Host "**********************************************************"
Write-Host "*                                                        *"
Write-Host "*    User has been created in Heidelberg.local domain    *"
Write-Host "*                                                        *"
Write-Host "**********************************************************" 
Get-ADUser "$fname $lname" -pr DisplayName,Company,StreetAddress,State,EmailAddress,Manager,Office,PostalCode,Title,Department
}
}
anscorf
