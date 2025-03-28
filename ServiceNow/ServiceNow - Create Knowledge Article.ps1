# Define ServiceNow API endpoint and token
$serviceNowApiUrl = "https://your-instance.service-now.com/api/now/table/kb_knowledge"
$accessToken = "your-servicenow-access-token"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Define the knowledge article details
$body = @{
    short_description = "How to resolve network issues"
    text = "Follow these steps to troubleshoot network problems..."
    category = "IT Support"
} | ConvertTo-Json -Depth 10

# Create the knowledge article
$response = Invoke-RestMethod -Uri $serviceNowApiUrl -Headers $headers -Method Post -Body $body
Write-Host "Knowledge article created with ID: $($response.result.sys_id)"