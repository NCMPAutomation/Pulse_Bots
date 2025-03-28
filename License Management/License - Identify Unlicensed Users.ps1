# Connect to Microsoft 365
Connect-MsolService

# Retrieve all unlicensed users
$UnlicensedUsers = Get-MsolUser -All | Where-Object { $_.isLicensed -eq $false }

# Display unlicensed users
$UnlicensedUsers | Select-Object DisplayName, UserPrincipalName