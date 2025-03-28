# Define the resource utilization log file path
$logFilePath = "C:\path\to\resource_utilization_log.txt"

# Read the log file
$logContent = Get-Content -Path $logFilePath

# Define the event patterns to correlate
$eventPattern1 = "High resource usage"
$eventPattern2 = "Resource usage normalized"

# Find and correlate events
$correlatedEvents = $logContent | Where-Object { $_ -match $eventPattern1 -or $_ -match $eventPattern2 }

# Print the correlated events
$correlatedEvents | ForEach-Object { Write-Output $_ }