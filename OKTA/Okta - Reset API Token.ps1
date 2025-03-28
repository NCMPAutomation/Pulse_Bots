# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/tokens"
$apiToken = "your-okta-api-token"
$tokenId = "token-id-to-reset"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Revoke the API token
Invoke-RestMethod -Uri "$apiUrl/$tokenId/lifecycle/revoke" -Headers $headers -Method Post
Write-Host "API Token with ID $tokenId has been reset."