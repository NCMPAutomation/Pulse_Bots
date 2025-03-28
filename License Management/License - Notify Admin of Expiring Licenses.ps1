# Connect to Microsoft 365
Connect-MsolService

# Define threshold for license expiration
$DaysToExpire = 30
$ExpiringLicenses = Get-MsolAccountSku | Where-Object { $_.ConsumedUnits -gt $_.ActiveUnits -and (Get-Date) -lt $_.ExpirationDate.AddDays($DaysToExpire) }

# Send email notification
if ($ExpiringLicenses) {
    Send-MailMessage -From "admin@domain.com" -To "itadmin@domain.com" -Subject "License Expiration Alert" -Body "Some licenses are expiring soon." -SmtpServer "smtp.domain.com"
}