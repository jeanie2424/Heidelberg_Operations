#==========================================#
#         Update User Attributes           #
#                                          #
#       Author: Daniel Scroggins           #
#         Year: 2015                       #
#        Heidelberg Distributing           #
#==========================================#

#Define Variables
$account = 
$office = 
$dep = 
$fname = 
$lname = 

Write-Host "#============================================#"
Write-Host "#    Welcome to the User Update Script       #"
Write-Host "#        Created by: Daniel Scroggins        #"
Write-Host "#         Heidelberg Distributing Co.        #"
Write-Host "#                   2015                     #"
Write-Host "#============================================#"
Write-Host

#Main function for getting user input
function main {
Write-Host "Ctrl + C at any time to stop script"
Write-Host
Write-Host "What would you like to update?"
Write-Host "1. Office (This will also updated address,city, etc...)"
Write-Host "2. Department"
Write-Host "3. Title"
Write-Host "4. Office Phone"
Write-Host "5. Mobile Phone"
Write-Host "X to exit"
$input = Read-Host "Enter Selection"

#Function for prompting for username
function usr {
Write-Host "Enter the user account(Example: Dan Scroggins)"
$usr = Read-Host
return $usr
}

#Function for Validating User
function val {
Try {
    Write-Host "Is this the correct user?"
    Get-ADUser "$account" -Properties *|Select Name,Office,StreetAddress,City,State,PostalCode,Department,Title,OfficePhone,MobilePhone
    $ans = Read-Host "Y or N"
    if ($ans -eq "Y") {} else {usr}
    } 
Catch {Write-Host "User not Found Please try again";val}
}

#Function for changing Office
function chgoff {
Write-Host
Write-Host "This will change the users office, continue?"
$ans = Read-Host "Y or N"
if ($ans -eq "N") {main}
else {$account = usr}

val

if ($ans -eq "Y") {
Write-Host
Write-Host
Write-Host "Please Select New Office"
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

Write-Host
Write-Host "This is what the Office will be set to:"
Write-Host
$offname
$offstreet
$offcity + ", " + $offstate + " " + $offzip
Write-Host
$ans = Read-Host "Continue? Y or N"
if ($ans -eq "Y") {set-aduser `
-Identity $account `
-Office "$offname" `
-StreetAddress "$offstreet" `
-City $offcity `
-PostalCode $offzip `
-State $offstate `

main
} else {main}
}

}


#Function for changing Department
function chgdep {
$ans = Read-Host "This will change the users Department, continue? Y or N"
if ($ans -eq "Y") {
$account = usr
val
$anss = Read-Host "Type in the new department"
set-aduser `
-Identity "$account" `
-Department "$anss"
main
} else {main}
}


#Function for changing Title
function chgtitle {
$ans = Read-Host "This will change the users Title, continue? Y or N"
if ($ans -eq "Y") {
$account = usr
val
$anss = Read-Host "Type in the new Title"
set-aduser `
-Identity "$account" `
-Title "$anss"
main
} else {main}
}


#Function for changing Office Phone
function chgoffph {
$ans = Read-Host "This will change the users Office Phone, continue? Y or N"
if ($ans -eq "Y") {
$account = usr
val
$anss = Read-Host "Type in the new Office Phone"
set-aduser `
-Identity "$account" `
-OfficePhone "$anss"
main
} else {main}
}


#Function for changing Mobile Phone
function chgmobph {
$ans = Read-Host "This will change the users Mobile Phone, continue? Y or N"
if ($ans -eq "Y") {
$account = usr
val
Write-Host "Type in the new Mobile Phone"
Write-Host "Example: 444-444-4444"
$anss = Read-Host
set-aduser `
-Identity "$account" `
-MobilePhone "$anss"
main
} else {main}
}


#Logic for determinig next action
if ($input -eq "x") {exit}
elseif ($input -eq 1) {chgoff}
elseif ($input -eq 2) {chgdep}
elseif ($input -eq 3) {chgtitle}
elseif ($input -eq 4) {chgoffph}
elseif ($input -eq 5) {chgmobph}

}
main