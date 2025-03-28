# Connect to Microsoft 365
Connect-MsolService

# Define the license SKU
$LicenseSku = "contoso:ENTERPRISEPACK"

# Find users with the specific license
$SpecificLicenseUsers = Get-MsolUser -All | Where-Object { $_.Licenses.AccountSkuId -contains $LicenseSku }

# Display users
$SpecificLicenseUsers | Select-Object DisplayName, UserPrincipalName