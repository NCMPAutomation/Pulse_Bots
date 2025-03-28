# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/users"
$apiToken = "your-okta-api-token"
$userId = "user-id-to-enable-mfa"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Enable MFA for the user
Invoke-RestMethod -Uri "$apiUrl/$userId/factors" -Headers $headers -Method Post -Body @{
    factorType = "token:software:totp"
    provider = "OKTA"
}
Write-Host "MFA enabled for user with ID $userId."