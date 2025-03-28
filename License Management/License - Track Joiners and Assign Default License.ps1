# Connect to Microsoft 365
Connect-MsolService

# Identify joiners who joined within the last week
$Joiners = Get-MsolUser -All | Where-Object { $_.LastDirSyncTime -gt (Get-Date).AddDays(-7) }

# Assign default license
foreach ($Joiner in $Joiners) {
    Set-MsolUserLicense -UserPrincipalName $Joiner.UserPrincipalName -AddLicenses "contoso:ENTERPRISEPACK"
}