# Extract the recipients of each email
foreach ($Email in $Emails) {
    Write-Output "Recipients: $($Email.To)"
}