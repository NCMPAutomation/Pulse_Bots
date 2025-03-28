# Define the application log file path
$logFilePath = "C:\path\to\application_log.txt"

# Read the log file
$logContent = Get-Content -Path $logFilePath

# Define the event patterns to correlate
$eventPattern1 = "Application crash"
$eventPattern2 = "Unhandled exception"

# Find and correlate events
$correlatedEvents = $logContent | Where-Object { $_ -match $eventPattern1 -or $_ -match $eventPattern2 }

# Print the correlated events
$correlatedEvents | ForEach-Object { Write-Output $_ }