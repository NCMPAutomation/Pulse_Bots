# Connect to Microsoft 365
Connect-MsolService

# Identify users with multiple licenses
$OverlicensedUsers = Get-MsolUser -All | Where-Object { ($_.Licenses).Count -gt 1 }

# Export overlicensed users
$OverlicensedUsers | Select-Object DisplayName, UserPrincipalName, Licenses | Export-Csv -Path "OverlicensedUsers.csv" -NoTypeInformation