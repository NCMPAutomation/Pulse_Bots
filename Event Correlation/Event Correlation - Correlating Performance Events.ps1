# Define the performance log file path
$logFilePath = "C:\path\to\performance_log.txt"

# Read the log file
$logContent = Get-Content -Path $logFilePath

# Define the event patterns to correlate
$eventPattern1 = "High CPU usage"
$eventPattern2 = "High memory usage"

# Find and correlate events
$correlatedEvents = $logContent | Where-Object { $_ -match $eventPattern1 -or $_ -match $eventPattern2 }

# Print the correlated events
$correlatedEvents | ForEach-Object { Write-Output $_ }