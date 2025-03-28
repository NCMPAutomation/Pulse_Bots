# Connect to Microsoft 365
Connect-MsolService

# Retrieve all licensed users
$LicensedUsers = Get-MsolUser -All | Where-Object { $_.isLicensed -eq $true }

# Display licensed users
$LicensedUsers | Select-Object DisplayName, UserPrincipalName, Licenses