# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/groups"
$apiToken = "your-okta-api-token"
$groupId = "group-id"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Get members of the specified group
$response = Invoke-RestMethod -Uri "$apiUrl/$groupId/users" -Headers $headers -Method Get

# Display group members
$response | ForEach-Object {
    Write-Host "Group Member: $($_.profile.login), Name: $($_.profile.firstName) $($_.profile.lastName)"
}