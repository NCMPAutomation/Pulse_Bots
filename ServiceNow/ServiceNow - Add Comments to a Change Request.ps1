# Define ServiceNow API endpoint and token
$serviceNowApiUrl = "https://your-instance.service-now.com/api/now/table/change_request"
$accessToken = "your-servicenow-access-token"
$changeRequestId = "change-request-sys-id"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Define the comment to be added
$body = @{
    work_notes = "This is a new comment added to the change request."
} | ConvertTo-Json -Depth 10

# Add the comment to the change request
Invoke-RestMethod -Uri "$serviceNowApiUrl/$changeRequestId" -Headers $headers -Method Patch -Body $body
Write-Host "Comment added to Change Request ID $changeRequestId."