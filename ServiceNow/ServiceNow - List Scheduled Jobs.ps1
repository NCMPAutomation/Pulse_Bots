# Define ServiceNow API endpoint and token
$serviceNowApiUrl = "https://your-instance.service-now.com/api/now/table/sys_trigger"
$accessToken = "your-servicenow-access-token"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Accept" = "application/json"
}

# Fetch all scheduled jobs
$response = Invoke-RestMethod -Uri $serviceNowApiUrl -Headers $headers -Method Get

# Display job details
$response.result | ForEach-Object {
    Write-Host "Job Name: $($_.name), Next Execution: $($_.next_action_time)"
}