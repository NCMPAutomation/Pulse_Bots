# Define GitLab API endpoint and token
$gitlabApiUrl = "https://gitlab.com/api/v4/groups/your-group-id/members/user-id-to-remove"
$accessToken = "your-gitlab-access-token"

# Set headers for the API call
$headers = @{
    "PRIVATE-TOKEN" = $accessToken
}

# Remove the user from the group
Invoke-RestMethod -Uri $gitlabApiUrl -Headers $headers -Method Delete
Write-Host "User removed from the group successfully."