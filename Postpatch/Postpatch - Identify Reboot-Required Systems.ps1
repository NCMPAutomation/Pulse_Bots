# Check if systems require a reboot after patching
$rebootRequired = Get-WindowsUpdateLog | Where-Object { $_.Status -eq "Reboot Required" }

# Display systems requiring a reboot
Write-Host "Systems requiring reboot:"
$rebootRequired | Format-Table