# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/tokens"
$apiToken = "your-okta-api-token"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Generate a new API token
$response = Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Post
Write-Host "New API Token: $($response.token)"