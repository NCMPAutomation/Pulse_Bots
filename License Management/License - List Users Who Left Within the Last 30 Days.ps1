# Connect to Microsoft 365
Connect-MsolService

# Retrieve users who were removed recently
$Leavers = Get-MsolUser -All | Where-Object { $_.BlockCredential -eq $true -and $_.LastDirSyncTime -gt (Get-Date).AddDays(-30) }

# Display data
$Leavers | Select-Object DisplayName, UserPrincipalName, LastDirSyncTime