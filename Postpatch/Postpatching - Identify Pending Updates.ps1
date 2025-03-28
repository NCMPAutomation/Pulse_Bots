# List pending updates that weren't applied during the patch cycle
$pendingUpdates = Get-WindowsUpdateLog | Where-Object { $_.Status -eq "Pending" }

Write-Host "Pending Updates:"
$pendingUpdates | Format-Table