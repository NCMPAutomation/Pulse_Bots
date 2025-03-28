# Define GitLab API endpoint and token
$gitlabApiUrl = "https://gitlab.com/api/v4/projects/your-project-id/repository/branches"
$accessToken = "your-gitlab-access-token"

# Set headers for the API call
$headers = @{
    "PRIVATE-TOKEN" = $accessToken
}

# Fetch repository branches
$response = Invoke-RestMethod -Uri $gitlabApiUrl -Headers $headers -Method Get

# Display branch names
$response | ForEach-Object {
    Write-Host "Branch: $($_.name)"
}