# Parameters
param (
    [string]$infobloxServer,
    [string]$sharePath,
    [string]$backupPath = "C:\InfobloxBackups"
)

# Connect to Infoblox
$credential = Get-Credential
New-IBSession -Server $infobloxServer -Credential $credential

# Create backup directory if it doesn't exist
if (!(Test-Path -Path $backupPath)) {
    New-Item -Path $backupPath -ItemType Directory | Out-Null
}

# Capture logs and take backup
$currentDate = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$backupFile = Join-Path -Path $backupPath -ChildPath "InfobloxLogs_$currentDate.zip"

# Example: Exporting logs (replace with actual log export commands)
$logs = "Sample log data"  # Replace with actual log data retrieval
$logs | Out-File -FilePath "$backupPath\InfobloxLogs_$currentDate.txt"

# Compress the logs
Compress-Archive -Path "$backupPath\InfobloxLogs_$currentDate.txt" -DestinationPath $backupFile

# Move backup to share path
if (!(Test-Path -Path $sharePath)) {
    New-Item -Path $sharePath -ItemType Directory | Out-Null
}
Move-Item -Path $backupFile -Destination $sharePath

Write-Host "Logs captured, backed up, and moved to $sharePath successfully."

# Disconnect from Infoblox
Remove-IBSession