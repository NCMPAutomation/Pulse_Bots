# Generate a report of failed patches
$failedPatches = Get-WindowsUpdateLog | Where-Object { $_.Status -eq "Failed" }

# Save the report to a file
$failedPatches | Export-Csv -Path "C:\Temp\PatchFailureReport.csv" -NoTypeInformation
Write-Host "Patch failure report generated."