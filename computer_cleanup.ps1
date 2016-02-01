#$creds = Get-Credential
$pc = Get-ADComputer -Filter * -SearchBase "cn=computers,dc=heidelberg,dc=local"
foreach ($i in $pc) {
$name = $i.Name
$dn = $i.DistinguishedName
$r = Test-Connection $name -Count 1 | select Address,IPV4Address
$ips = $r.IPV4Address.IPAddressToString
switch -wildcard ($ips)
    { 
        "10.23.2*" {Move-ADObject -Identity "$dn" -TargetPath "OU=Computers,OU=Dayton,DC=Heidelberg,DC=local"}
        "10.23.7*" {Move-ADObject -Identity "$dn" -TargetPath "OU=Computers,OU=Cleveland,DC=Heidelberg,DC=local"}
        "10.23.5*" {Move-ADObject -Identity "$dn" -TargetPath "OU=Computers,OU=Ohio Valley,DC=Heidelberg,DC=local"}
        "10.23.10*" {Move-ADObject -Identity "$dn" -TargetPath "OU=Computers,OU=Hebron,DC=Heidelberg,DC=local"}
        "10.23.8*" {Move-ADObject -Identity "$dn" -TargetPath "OU=Computers,OU=Toledo,DC=Heidelberg,DC=local"}
        "10.23.3*" {Move-ADObject -Identity "$dn" -TargetPath "OU=Computers,OU=Lorain,DC=Heidelberg,DC=local"}
        "10.23.9*" {Move-ADObject -Identity "$dn" -TargetPath "OU=Computers,OU=Columbus,DC=Heidelberg,DC=local"}
        "10.23.1*" {Move-ADObject -Identity "$dn" -TargetPath "OU=Computers,OU=Cincinnati,DC=Heidelberg,DC=local"}
        default {Write-Host "Computer location could not be determined. Leaving in Computers OU"}
    }
}