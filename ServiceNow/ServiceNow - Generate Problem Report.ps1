# Define ServiceNow API endpoint and token
$serviceNowApiUrl = "https://your-instance.service-now.com/api/now/table/problem"
$accessToken = "your-servicenow-access-token"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Accept" = "application/json"
}

# Fetch problem records
$response = Invoke-RestMethod -Uri $serviceNowApiUrl -Headers $headers -Method Get

# Export to a CSV file for reporting
$response.result | Export-Csv -Path "C:\ProblemReport.csv" -NoTypeInformation
Write-Host "Problem report exported to C:\ProblemReport.csv."