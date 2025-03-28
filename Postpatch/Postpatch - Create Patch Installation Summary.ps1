# Generate a summary of patches installed with statuses
$patchSummary = Get-HotFix | Select-Object Description, InstalledOn

# Save the summary to a file
$patchSummary | Export-Csv -Path "C:\Temp\PatchInstallationSummary.csv" -NoTypeInformation
Write-Host "Patch installation summary saved."