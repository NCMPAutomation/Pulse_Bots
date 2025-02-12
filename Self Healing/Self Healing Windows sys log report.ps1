# Define the path where the logs will be saved
$logPath = "C:\Logs\SystemLogs.txt"
 
# Create the directory if it doesn't exist
if (-not (Test-Path -Path "C:\Logs")) {
    New-Item -ItemType Directory -Path "C:\Logs"
}
 
# Get the system event logs
Get-EventLog -LogName System | Out-File -FilePath $logPath
 
# Confirm the logs have been captured
Write-Output "System logs have been captured and saved to $logPath"