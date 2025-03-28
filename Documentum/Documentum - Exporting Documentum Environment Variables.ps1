# Export all Documentum-related environment variables
Get-ChildItem Env: | Where-Object { $_.Name -match "DOCUMENTUM" } | ForEach-Object {
    Write-Host "$($_.Name): $($_.Value)"
}