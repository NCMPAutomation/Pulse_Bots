# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/groups"
$apiToken = "your-okta-api-token"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Get all groups
$response = Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Get

# Display group names
$response | ForEach-Object {
    Write-Host "Group: $($_.profile.name)"
}