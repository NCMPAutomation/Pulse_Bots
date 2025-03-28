# Define ServiceNow API endpoint and token
$serviceNowApiUrl = "https://your-instance.service-now.com/api/now/table/change_request"
$accessToken = "your-servicenow-access-token"
$changeRequestId = "change-request-sys-id"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Define the new status
$body = @{
    state = "In Progress"  # Update the change request to "In Progress"
} | ConvertTo-Json -Depth 10

# Update the change request
Invoke-RestMethod -Uri "$serviceNowApiUrl/$changeRequestId" -Headers $headers -Method Patch -Body $body
Write-Host "Change Request ID $changeRequestId has been updated to 'In Progress'."