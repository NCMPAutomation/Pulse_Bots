# Define GitLab API endpoint and token
$gitlabApiUrl = "https://gitlab.com/api/v4/projects/your-project-id/merge_requests"
$accessToken = "your-gitlab-access-token"

# Set headers for the API call
$headers = @{
    "PRIVATE-TOKEN" = $accessToken
}

# Define the merge request details
$body = @{
    source_branch = "feature-branch"
    target_branch = "main"
    title         = "Feature Implementation"
} | ConvertTo-Json -Depth 10

# Create the merge request
$response = Invoke-RestMethod -Uri $gitlabApiUrl -Headers $headers -Method Post -Body $body
Write-Host "Merge Request created with ID: $($response.id)"