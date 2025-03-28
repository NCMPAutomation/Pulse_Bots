# Export all Oracle-related environment variables
Get-ChildItem Env: | Where-Object { $_.Name -match "ORACLE" } | ForEach-Object {
    Write-Host "$($_.Name): $($_.Value)"
}