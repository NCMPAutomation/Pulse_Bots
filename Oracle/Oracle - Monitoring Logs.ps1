# Path to Oracle log directory
$LogDir = "C:\Oracle\Logs"

# Monitor log files for changes
Get-ChildItem -Path $LogDir -Filter "*.log" | ForEach-Object {
    Write-Host "Log file: $($_.FullName)"
}