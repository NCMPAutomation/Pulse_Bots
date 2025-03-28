# Connect to Microsoft 365
Connect-MsolService

# Define user
$UserPrincipalName = "leaver@domain.com"

# Remove all licenses from the user
Set-MsolUserLicense -UserPrincipalName $UserPrincipalName -RemoveLicenses "*"