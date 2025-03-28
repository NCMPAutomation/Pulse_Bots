# Connect to Microsoft 365
Connect-MsolService

# Generate a daily license assignment report
$LicensedUsers = Get-MsolUser -All | Where-Object { $_.isLicensed -eq $true }
$LicensedUsers | Export-Csv -Path "DailyLicenseReport.csv" -NoTypeInformation

# Set up a scheduled task using Task Scheduler on Windows (manual step after script).