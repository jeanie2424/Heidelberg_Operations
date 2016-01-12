Write-Host " ==========================================="
Write-Host "|    Adding users to a group the easy way   |"
Write-Host "|     Author: Dan `"Scroggy`" Scroggins       |"
Write-Host " ==========================================="


#Function for capturing input file
function file {
Write-Host
    $filename = Read-Host "Please enter the file name"
    Try {
        $array = Get-Content $filename
        }
    catch {Write-Host "File name is invalid please try again";file}
return $array
}

#Function for creating group
function cgroup {
    $name = Read-Host "Enter the name for the group | Example: HD-Box-Users"
    New-ADGroup -name "$name"
}

#Function for capturing group information
function getgroup {
    $groupn = Read-Host "Enter group name"
    try {
        $groupdn = Get-ADGroup "$groupn"
        Write-Host "Group found $groupdn"
        }
    catch 
        {
        $ans = Read-Host "Group not found | [T]ry again, [C]eate group, [E]xit?"
        if ($ans -eq "T") {getgroup}
        elseif ($ans -eq "C") {cgroup}
        elseif ($ans -eq "E") {exit}
        }
return $groupdn,$groupn
}

function main {
    Write-Host "NOTE: Input file must be in the same directory as the script and in the CSV format"
    $list = file
    $gdn,$gn = getgroup
    Write-Host "Now adding users to the group $gn"
    foreach ($i in $list) {$p = get-aduser -Identity "$i";Add-ADGroupMember $gdn -Members "$p"}
    Write-Host "The follow people have been added to group $gn"
    Get-ADGroupMember $gn|select name
}
main