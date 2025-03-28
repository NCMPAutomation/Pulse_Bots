# Connect to Microsoft 365
Connect-MsolService

# Define period for inactive users
$ThresholdDate = (Get-Date).AddDays(-30)

# Find inactive users and reclaim licenses
$Leavers = Get-MsolUser -All | Where-Object { $_.LastPasswordChangeTimestamp -lt $ThresholdDate }
foreach ($User in $Leavers) {
    Set-MsolUserLicense -UserPrincipalName $User.UserPrincipalName -RemoveLicenses "*"
}