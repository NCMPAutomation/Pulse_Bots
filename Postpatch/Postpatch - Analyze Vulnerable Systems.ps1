# Identify systems with missing critical patches
$vulnerableSystems = Get-HotFix | Where-Object { $_.Description -match "Critical" }

# Display vulnerable systems
Write-Host "Vulnerable Systems:"
$vulnerableSystems | Format-Table