# Define GitLab API endpoint and token
$gitlabApiUrl = "https://gitlab.com/api/v4/groups/your-group-id/members"
$accessToken = "your-gitlab-access-token"

# Set headers for the API call
$headers = @{
    "PRIVATE-TOKEN" = $accessToken
}

# Define user and access level details
$body = @{
    user_id     = "user-id-to-add"
    access_level = 30  # Developer access level
} | ConvertTo-Json -Depth 10

# Add the user to the group
$response = Invoke-RestMethod -Uri $gitlabApiUrl -Headers $headers -Method Post -Body $body
Write-Host "User added to the group with ID: $response.id."