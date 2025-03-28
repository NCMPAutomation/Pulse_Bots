# Define the user activity log file path
$logFilePath = "C:\path\to\user_activity_log.txt"

# Read the log file
$logContent = Get-Content -Path $logFilePath

# Define the event patterns to correlate
$eventPattern1 = "User login"
$eventPattern2 = "User logout"

# Find and correlate events
$correlatedEvents = $logContent | Where-Object { $_ -match $eventPattern1 -or $_ -match $eventPattern2 }

# Print the correlated events
$correlatedEvents | ForEach-Object { Write-Output $_ }