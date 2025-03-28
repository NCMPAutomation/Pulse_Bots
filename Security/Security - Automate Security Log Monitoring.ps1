# Define the log name
$LogName = "Security"

# Get the latest security log entries
Get-EventLog -LogName $LogName -Newest 100