# Connect to Microsoft 365
Connect-MsolService

# Define department
$Department = "Former Employees"

# Remove licenses from users in the specific department
$Users = Get-MsolUser -All | Where-Object { $_.Department -eq $Department }
foreach ($User in $Users) {
    Set-MsolUserLicense -UserPrincipalName $User.UserPrincipalName -RemoveLicenses "*"
}