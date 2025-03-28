# Connect to Microsoft 365
Connect-MsolService

# Retrieve users with license insights
$Users = Get-MsolUser -All | Select-Object DisplayName, UserPrincipalName, Licenses, LastDirSyncTime

# Export insights to a CSV file
$Users | Export-Csv -Path "UserLicenseInsights.csv" -NoTypeInformation