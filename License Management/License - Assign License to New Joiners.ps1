# Connect to Microsoft 365
Connect-MsolService

# Define user and license parameters
$UserPrincipalName = "newuser@domain.com"
$LicenseSku = "contoso:ENTERPRISEPACK"

# Assign license to the user
Set-MsolUserLicense -UserPrincipalName $UserPrincipalName -AddLicenses $LicenseSku