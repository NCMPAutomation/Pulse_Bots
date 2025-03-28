# Connect to Microsoft 365
Connect-MsolService

# Monitor license assignment using logs
$RealTimeLicenseAssignment = Start-Transcript -Path "RealTimeLicenseLog.txt"
while ($true) {
    Get-MsolUser -All | Where-Object { $_.isLicensed -eq $true }
    Start-Sleep -Seconds 60
}
Stop-Transcript