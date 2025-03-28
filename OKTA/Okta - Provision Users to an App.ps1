# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/apps"
$apiToken = "your-okta-api-token"
$appId = "app-id"
$userId = "user-id"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Provision user to the app
$body = @{
    id = $userId
} | ConvertTo-Json -Depth 10

Invoke-RestMethod -Uri "$apiUrl/$appId/users" -Headers $headers -Method Post -Body $body
Write-Host "User with ID $userId provisioned to app $appId."