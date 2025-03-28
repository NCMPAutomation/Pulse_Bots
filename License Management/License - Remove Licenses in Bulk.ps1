# Connect to Microsoft 365
Connect-MsolService

# Import users from CSV and remove licenses
$Users = Import-Csv -Path "UsersToUnlicense.csv"
foreach ($User in $Users) {
    Set-MsolUserLicense -UserPrincipalName $User.UserPrincipalName -RemoveLicenses "*"
}