# Connect to Microsoft 365
Connect-MsolService

# Check new users for assigned licenses
$NewUsers = Get-MsolUser -All | Where-Object { $_.LastDirSyncTime -gt (Get-Date).AddDays(-7) }
foreach ($User in $NewUsers) {
    if (-not $User.isLicensed) {
        Write-Output "$($User.DisplayName) has no license assigned."
    }
}