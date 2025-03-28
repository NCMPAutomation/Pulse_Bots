# Define GitLab API endpoint and token
$gitlabApiUrl = "https://gitlab.com/api/v4/projects/your-project-id/merge_requests"
$accessToken = "your-gitlab-access-token"

# Set headers for the API call
$headers = @{
    "PRIVATE-TOKEN" = $accessToken
}

# Fetch the list of merge requests
$response = Invoke-RestMethod -Uri $gitlabApiUrl -Headers $headers -Method Get

# Display merge request titles and statuses
$response | ForEach-Object {
    Write-Host "Merge Request: $($_.title), Status: $($_.state)"
}