# Define GitLab API endpoint and token
$gitlabApiUrl = "https://gitlab.com/api/v4/projects/your-project-id/merge_requests/merge-request-id/approve"
$accessToken = "your-gitlab-access-token"

# Set headers for the API call
$headers = @{
    "PRIVATE-TOKEN" = $accessToken
}

# Approve the merge request
Invoke-RestMethod -Uri $gitlabApiUrl -Headers $headers -Method Post
Write-Host "Merge Request approved successfully."