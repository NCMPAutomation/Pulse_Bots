# Connect to Microsoft 365
Connect-MsolService

# Retrieve all licensed users and export data
$LicensedUsers = Get-MsolUser -All | Where-Object { $_.isLicensed -eq $true }
$LicensedUsers | Select-Object DisplayName, UserPrincipalName, Licenses | Export-Csv -Path "LicensedUsers.csv" -NoTypeInformation