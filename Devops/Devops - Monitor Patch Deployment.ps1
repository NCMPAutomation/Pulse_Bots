# Monitor the progress of patch deployment
$logFile = "C:\Windows\WindowsUpdate.log"

Write-Host "Monitoring Windows Update log for patch deployment progress..."
Get-Content $logFile -Wait