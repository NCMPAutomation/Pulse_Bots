# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/users"
$apiToken = "your-okta-api-token"
$userId = "user-id-to-update"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Define the updated profile details
$body = @{
    profile = @{
        phoneNumber = "123-456-7890"
        department  = "Engineering"
    }
} | ConvertTo-Json -Depth 10

# Send the API request to update the user's profile
Invoke-RestMethod -Uri "$apiUrl/$userId" -Headers $headers -Method Post -Body $body
Write-Host "User profile updated for ID $userId."