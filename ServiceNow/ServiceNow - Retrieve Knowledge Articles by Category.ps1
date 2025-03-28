# Define ServiceNow API endpoint and token
$serviceNowApiUrl = "https://your-instance.service-now.com/api/now/table/kb_knowledge"
$accessToken = "your-servicenow-access-token"
$category = "IT Support"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Accept" = "application/json"
}

# Fetch knowledge articles in the specified category
$params = @{
    sysparm_query = "category=$category"
    sysparm_fields = "number,short_description"
}

$response = Invoke-RestMethod -Uri $serviceNowApiUrl -Headers $headers -Method Get -Body $params
$response.result | ForEach-Object {
    Write-Host "Article Number: $($_.number), Description: $($_.short_description)"
}