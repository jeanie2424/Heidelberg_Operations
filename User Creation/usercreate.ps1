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
$ffunc = {$fname = Read-Host 'Enter first name: '}
$lfunc = {$lname = Read-Host 'Enter last name: '}
$jfunc = {$jobtitle = Read-Host 'Enter Job Title: '}
$dfunc = {$dep = Read-Host 'Enter Department: '}
&$ffunc
&$lfunc
&$jfunc
&$dfunc

#Prompts User for inputing the Company
Write-Host "Please Select Company"
Write-Host 
Write-Host "1 for Heidelberg Distributing"
Write-Host "2 for Ohio Valley Wine & Beer"
Write-Host "3 for Rampant Brands"
Write-Host "4 for Wine Trends"
$cfunc = {$comp = Read-Host 'Enter Company: '}
&$cfunc

#Logic for Company selection
if ($comp -EQ 1) {$compu = "Heidelberg Distributing"; $email=$fname + "." + $lname + "@HeidelbergDistributing.com"}
elseif ($comp -eq 2) {$compu = "Ohio Valley Wine & Beer"; $email=$fname + "." + $lname + "@OVWineBeer.com"}
elseif ($comp -eq 3) {$compu = "Rampant Brands"; $email=$fname + "." + $lname + "@RampantBrands.com"}
elseif ($comp -eq 4) {$compu = "Wine Trends"; $email=$fname + "." + $lname + "@WineTrends.com"}

#Blank spaces
Write-Host
Write-Host

#Prompts User for inputing the Office
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
$ofunc = {$office = Read-Host 'Enter office: '}
&$ofunc

#Logic for office selection
if ($office -EQ 1) {$offstreet = "1518 Dalton Avenue"; $offcity = "Cincinnati"; $offstate = "OH"; $offzip = "45214"}
elseif ($office -EQ 2) {$offstreet = "9101 E Pleasant Valley Road"; $offcity = "Independence"; $offstate = "OH"; $offzip = "44131"}
elseif ($office -EQ 3) {$offstreet = "3801 Parkwest Drive"; $offcity = "Columbus"; $offstate = "OH"; $offzip = "43228"}
elseif ($office -EQ 4) {$offstreet = "3601 Dryden Road"; $offcity = "Moraine"; $offstate = "OH"; $offzip = "45439"}
elseif ($office -EQ 5) {$offstreet = "2245 Progress Drive"; $offcity = "Hebron"; $offstate = "KY"; $offzip = "41048"}
elseif ($office -EQ 6) {$offstreet = "5901 Baumhart Road"; $offcity = "Lorain"; $offstate = "OH"; $offzip = "44053"}
elseif ($office -EQ 7) {$offstreet = "10975 Medallion Drive"; $offcity = "Evendale"; $offstate = "OH"; $offzip = "45412"}
elseif ($office -EQ 8) {$offstreet = "912 Third Street"; $offcity = "Perrysburg"; $offstate = "OH"; $offzip = "43551"}
elseif ($office -EQ 9) {$offstreet = "1265 Crescent Street"; $offcity = "Youngstown"; $offstate = "OH"; $offzip = "44502"}

#Display data for user confirmation
$anscorf = {
Write-Host
Write-Host
Write-Host $fname $lname
Write-Host $jobtitle
Write-Host $dep
Write-Host $compu
Write-Host $email
Write-Host $offstreet 
Write-Host $offcity "," $offstate $offzip
$ans = Read-Host Is this information correct? y or n

Write-Host
Write-Host

#Logic for information correction
if ($ans -eq "n") {
Write-Host "Enter Selection 1 - 5"
Write-Host "1 for first name"
Write-Host "2 for last name"
Write-Host "3 for job title"
Write-Host "4 for department"
Write-Host "5 for company"
Write-Host "6 for office"
Write-Host "Street, City and Zip are determined by the office selection"
$anscor = Read-Host "Selection: "
if ($anscor -eq 1) {&$ffunc}
elseif ($anscor -eq 2) {&$lfunc}
elseif ($anscor -eq 3) {&$jfunc}
elseif ($anscor -eq 4) {&$dfunc}
elseif ($anscor -eq 5) {&$cfunc}
elseif ($anscor -eq 6) {&$ofunc}
Write-Host
Write-Host
&$anscorf
} else {
Write-Host "User will now be created in Heidelberg.local domain"
}}
&$anscorf