# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/users"
$apiToken = "your-okta-api-token"
$userId = "user-id-to-check-mfa-status"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Get the MFA factors for the user
$response = Invoke-RestMethod -Uri "$apiUrl/$userId/factors" -Headers $headers -Method Get

# Display the user's MFA status
$response | ForEach-Object {
    Write-Host "MFA Factor: $($_.factorType), Provider: $($_.provider), Status: $($_.status)"
}