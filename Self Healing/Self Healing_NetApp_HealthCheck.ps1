# Define variables
$netAppServer = "https://netapp.example.com" # Replace with your NetApp server URL
$username = "admin"                          # NetApp username
$password = "password"                       # NetApp password
$logFile = "C:\Temp\NetAppHealthCheck.log"   # Path to save the log file

# Step 1: Authenticate with NetApp
$authHeader = @{
    Authorization = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$username:$password"))
}

# Step 2: Check Cluster Health
Write-Output "Checking cluster health..." | Out-File -Append $logFile
$response = Invoke-RestMethod -Uri "$netAppServer/api/cluster" -Method GET -Headers $authHeader
if ($response) {
    Write-Output "Cluster health: $($response.status)" | Out-File -Append $logFile
} else {
    Write-Error "Failed to retrieve cluster health."
}

# Step 3: Check Storage Health
Write-Output "Checking storage health..." | Out-File -Append $logFile
$response = Invoke-RestMethod -Uri "$netAppServer/api/storage/aggregates" -Method GET -Headers $authHeader
if ($response) {
    Write-Output "Storage aggregates: $($response.items | ConvertTo-Json -Depth 10)" | Out-File -Append $logFile
} else {
    Write-Error "Failed to retrieve storage health."
}

# Step 4: Check Network Interfaces
Write-Output "Checking network interfaces..." | Out-File -Append $logFile
$response = Invoke-RestMethod -Uri "$netAppServer/api/network/interfaces" -Method GET -Headers $authHeader
if ($response) {
    Write-Output "Network interfaces: $($response.items | ConvertTo-Json -Depth 10)" | Out-File -Append $logFile
} else {
    Write-Error "Failed to retrieve network interfaces."
}

Write-Output "Health check completed. Review the log file at $logFile."
