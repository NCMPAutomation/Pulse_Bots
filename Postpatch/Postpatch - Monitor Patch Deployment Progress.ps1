# Monitor the progress of patch deployment
$deploymentStatus = Get-WindowsUpdateLog | Where-Object { $_.Status -eq "In Progress" }

# Display deployment progress
Write-Host "Patch Deployment Progress:"
$deploymentStatus | Format-Table