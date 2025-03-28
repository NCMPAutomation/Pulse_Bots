# List patches installed in the last 24 hours
$recentUpdates = Get-HotFix | Where-Object { $_.InstalledOn -gt (Get-Date).AddHours(-24) }

Write-Host "Recent Updates Installed:"
$recentUpdates | Format-Table