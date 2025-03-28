# Define GitLab API endpoint and token
$gitlabApiUrl = "https://gitlab.com/api/v4/projects/your-project-id/repository/branches/branch-name-to-delete"
$accessToken = "your-gitlab-access-token"

# Set headers for the API call
$headers = @{
    "PRIVATE-TOKEN" = $accessToken
}

# Delete the branch
Invoke-RestMethod -Uri $gitlabApiUrl -Headers $headers -Method Delete
Write-Host "Branch deleted successfully."