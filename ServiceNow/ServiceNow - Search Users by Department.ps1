# Define ServiceNow API endpoint and token
$serviceNowApiUrl = "https://your-instance.service-now.com/api/now/table/sys_user"
$accessToken = "your-servicenow-access-token"
$departmentName = "Engineering"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Accept" = "application/json"
}

# Search for users in the specified department
$params = @{
    sysparm_query = "department.name=$departmentName"
    sysparm_fields = "name,email,department"
}

# Get users
$response = Invoke-RestMethod -Uri $serviceNowApiUrl -Headers $headers -Method Get -Body $params
$response.result | ForEach-Object {
    Write-Host "Name: $($_.name), Email: $($_.email), Department: $($_.department)"
}