# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/users"
$apiToken = "your-okta-api-token"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Make API request to get active users
$response = Invoke-RestMethod -Uri "$apiUrl?filter=status eq 'ACTIVE'" -Headers $headers -Method Get

# Display the list of active users
$response | ForEach-Object {
    Write-Host "User: $($_.profile.login), Name: $($_.profile.firstName) $($_.profile.lastName)"
}