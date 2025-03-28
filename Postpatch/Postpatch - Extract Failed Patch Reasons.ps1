# Retrieve error codes and reasons for failed patches
$failedUpdates = Get-WindowsUpdateLog | Where-Object { $_.Status -eq "Failed" }

foreach ($update in $failedUpdates) {
    Write-Host "Patch: $($update.UpdateTitle) - Error Code: $($update.LastErrorCode)"
}