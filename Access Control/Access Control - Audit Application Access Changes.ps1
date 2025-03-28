# Define log file path
$LogFile = "C:\CustomApp\AccessLog.txt"

# Display audit logs
Get-Content $LogFile | ForEach-Object { Write-Output $_ }