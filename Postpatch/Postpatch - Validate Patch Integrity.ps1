# Validate the integrity of installed patches
$patchIntegrity = Get-HotFix | Select-Object Description, InstalledOn, Source

# Display patch integrity details
Write-Host "Patch Integrity:"
$patchIntegrity | Format-Table