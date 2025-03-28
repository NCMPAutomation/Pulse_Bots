# Define ServiceNow API endpoint and token
$serviceNowApiUrl = "https://your-instance.service-now.com/api/now/table/problem"
$accessToken = "your-servicenow-access-token"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Accept" = "application/json"
}

# Define filter to retrieve open problems only
$params = @{
    sysparm_query = "state=1"  # State 1 means "Open"
    sysparm_fields = "number,short_description,state"
}

# Fetch open problem records
$response = Invoke-RestMethod -Uri $serviceNowApiUrl -Headers $headers -Method Get -Body $params
$response.result | ForEach-Object {
    Write-Host "Problem: $($_.number), Description: $($_.short_description), State: $($_.state)"
}