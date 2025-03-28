# Identify services that stopped or failed post-patching
$impactedServices = Get-Service | Where-Object { $_.Status -eq "Stopped" }

Write-Host "Services Impacted Post-Patching:"
$impactedServices | Format-Table