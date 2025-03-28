# Define ServiceNow API endpoint and token
$serviceNowApiUrl = "https://your-instance.service-now.com/api/now/table/problem"
$accessToken = "your-servicenow-access-token"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Define the details of the problem record
$body = @{
    short_description = "Recurring issue with network connectivity."
    description = "Users are experiencing intermittent network disconnections."
    urgency = "2"  # Medium urgency
} | ConvertTo-Json -Depth 10

# Create the problem record
$response = Invoke-RestMethod -Uri $serviceNowApiUrl -Headers $headers -Method Post -Body $body
Write-Host "Problem record created with ID: $($response.result.sys_id)"