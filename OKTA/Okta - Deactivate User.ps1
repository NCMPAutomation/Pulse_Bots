# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/users"
$apiToken = "your-okta-api-token"
$userId = "user-id-to-deactivate"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Deactivate user
Invoke-RestMethod -Uri "$apiUrl/$userId/lifecycle/deactivate" -Headers $headers -Method Post
Write-Host "User with ID $userId has been deactivated."