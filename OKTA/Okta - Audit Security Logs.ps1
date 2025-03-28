# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/logs"
$apiToken = "your-okta-api-token"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Retrieve security logs
$response = Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Get

# Display the logs
$response | ForEach-Object {
    Write-Host "Timestamp: $($_.published), Event: $($_.eventType), Actor: $($_.actor.alternateId)"
}