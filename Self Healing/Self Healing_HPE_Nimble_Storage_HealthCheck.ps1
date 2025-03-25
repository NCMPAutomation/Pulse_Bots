# Define variables
$nimbleServer = "https://nimble.example.com" # Replace with your Nimble Storage server URL
$username = "admin"                          # Nimble Storage username
$password = "password"                       # Nimble Storage password
$logFile = "C:\Temp\NimbleHealthCheck.log"   # Path to save the log file

# Step 1: Authenticate with Nimble Storage
$authHeader = @{
    Authorization = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$username:$password"))
}

# Step 2: Check System Health
Write-Output "Checking system health..." | Out-File -Append $logFile
$response = Invoke-RestMethod -Uri "$nimbleServer/v1/arrays" -Method GET -Headers $authHeader
if ($response) {
    Write-Output "System health: $($response.data | ConvertTo-Json -Depth 10)" | Out-File -Append $logFile
} else {
    Write-Error "Failed to retrieve system health."
}

# Step 3: Monitor Performance Metrics
Write-Output "Checking performance metrics..." | Out-File -Append $logFile
$response = Invoke-RestMethod -Uri "$nimbleServer/v1/performance" -Method GET -Headers $authHeader
if ($response) {
    Write-Output "Performance metrics: $($response.data | ConvertTo-Json -Depth 10)" | Out-File -Append $logFile
} else {
    Write-Error "Failed to retrieve performance metrics."
}

# Step 4: Check Hardware Status
Write-Output "Checking hardware status..." | Out-File -Append $logFile
$response = Invoke-RestMethod -Uri "$nimbleServer/v1/hardware" -Method GET -Headers $authHeader
if ($response) {
    Write-Output "Hardware status: $($response.data | ConvertTo-Json -Depth 10)" | Out-File -Append $logFile
} else {
    Write-Error "Failed to retrieve hardware status."
}

Write-Output "Health check completed. Review the log file at $logFile."
