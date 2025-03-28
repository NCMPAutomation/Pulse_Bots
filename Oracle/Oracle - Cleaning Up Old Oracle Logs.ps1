# Define log directory and retention period
$LogDir = "C:\Oracle\Logs"
$RetentionDays = 30

# Remove logs older than the retention period
Get-ChildItem -Path $LogDir -Filter "*.log" | Where-Object {
    $_.LastWriteTime -lt (Get-Date).AddDays(-$RetentionDays)
} | Remove-Item -Verbose
Write-Host "Old Oracle logs cleaned up from $LogDir"