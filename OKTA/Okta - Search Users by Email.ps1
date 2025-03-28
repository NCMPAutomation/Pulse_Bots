# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/users"
$apiToken = "your-okta-api-token"
$email = "user@example.com"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Search for the user by email
$response = Invoke-RestMethod -Uri "$apiUrl?filter=profile.email eq '$email'" -Headers $headers -Method Get

# Display user information
$response | ForEach-Object {
    Write-Host "User Found: $($_.profile.login), Name: $($_.profile.firstName) $($_.profile.lastName)"
}