# Connect to Microsoft 365
Connect-MsolService

# Identify users inactive for 90 days
$InactiveUsers = Get-MsolUser -All | Where-Object { $_.LastPasswordChangeTimestamp -lt (Get-Date).AddDays(-90) }

# Deactivate licenses
foreach ($User in $InactiveUsers) {
    Set-MsolUserLicense -UserPrincipalName $User.UserPrincipalName -RemoveLicenses "*"
}