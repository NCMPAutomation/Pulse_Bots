# Path to logs directory
$LogDirectory = "C:\Informatica\Logs"

# Monitor for changes in log files
Get-ChildItem -Path $LogDirectory -Filter "*.log" | ForEach-Object {
    Write-Host "Log file: $($_.FullName)"
}