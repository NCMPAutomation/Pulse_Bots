# Retrieve the list of failed patches from the Windows Update log
$failedUpdates = Get-WindowsUpdateLog | Where-Object { $_.Status -eq "Failed" }

# Display failed patches
Write-Host "Failed Patches:"
$failedUpdates | Format-Table