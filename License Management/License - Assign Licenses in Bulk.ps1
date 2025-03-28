# Connect to Microsoft 365
Connect-MsolService

# Import users from CSV and assign licenses
$Users = Import-Csv -Path "UsersToLicense.csv"
foreach ($User in $Users) {
    Set-MsolUserLicense -UserPrincipalName $User.UserPrincipalName -AddLicenses "contoso:ENTERPRISEPACK"
}