# Connect to Microsoft 365
Connect-MsolService

# Retrieve joiners and leavers
$Joiners = Get-MsolUser -All | Where-Object { $_.LastDirSyncTime -gt (Get-Date).AddDays(-30) }
$Leavers = Get-MsolUser -All | Where-Object { $_.BlockCredential -eq $true }

# Export to CSV
$Joiners | Export-Csv -Path "Joiners.csv" -NoTypeInformation
$Leavers | Export-Csv -Path "Leavers.csv" -NoTypeInformation