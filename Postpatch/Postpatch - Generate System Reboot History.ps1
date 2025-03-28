# Retrieve system reboot history to correlate with patching
$eventLogs = Get-EventLog -LogName System | Where-Object { $_.EventID -eq 1074 }

Write-Host "System Reboot History:"
$eventLogs | Format-Table TimeGenerated, Message