# Generate a report of installed and missing patches
$patchReport = Get-HotFix | Select-Object Description, InstalledOn

# Save the report to a file
$patchReport | Export-Csv -Path "C:\Temp\PatchComplianceReport.csv" -NoTypeInformation
Write-Host "Patch compliance report generated."