# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/users"
$apiToken = "your-okta-api-token"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Fetch inactive users
$response = Invoke-RestMethod -Uri "$apiUrl?filter=status eq 'DEPROVISIONED'" -Headers $headers -Method Get

# Deactivate each inactive user
$response | ForEach-Object {
    $userId = $_.id
    Invoke-RestMethod -Uri "$apiUrl/$userId/lifecycle/deactivate" -Headers $headers -Method Post
    Write-Host "User with ID $userId deactivated."
}