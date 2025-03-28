# Identify patches that are stuck in installation
$stuckUpdates = Get-WindowsUpdateLog | Where-Object { $_.Status -eq "In Progress" -and $_.LastErrorCode -ne $null }

Write-Host "Stuck Updates:"
$stuckUpdates | Format-Table