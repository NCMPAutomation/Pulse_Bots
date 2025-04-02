# Define the access control log of file path
$logFilePath = "C:\path\to\access_control_log.txt"

# Read the log file
$logContent = Get-Content -Path $logFilePath

# Define the event patterns to correlate
$eventPattern1 = "Access granted"
$eventPattern2 = "Access denied"

# Find and correlate events
$correlatedEvents = $logContent | Where-Object { $_ -match $eventPattern1 -or $_ -match $eventPattern2 }

# Print the correlated events
$correlatedEvents | ForEach-Object { Write-Output $_ }
