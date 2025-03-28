# Define ServiceNow API endpoint and token
$serviceNowApiUrl = "https://your-instance.service-now.com/api/now/table/sc_req_item"
$accessToken = "your-servicenow-access-token"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Accept" = "application/json"
}

# Define the filter to retrieve only open request items
$params = @{
    sysparm_query = "state=1"  # State 1 means "Open"
    sysparm_fields = "number,short_description,state"
}

# Get the open request items
$response = Invoke-RestMethod -Uri $serviceNowApiUrl -Headers $headers -Method Get -Body $params
$response.result | ForEach-Object {
    Write-Host "Request: $($_.number), Description: $($_.short_description), State: $($_.state)"
}