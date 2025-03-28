# Define GitLab API endpoint and token
$gitlabApiUrl = "https://gitlab.com/api/v4/projects/your-project-id/repository/branches"
$accessToken = "your-gitlab-access-token"

# Set headers for the API call
$headers = @{
    "PRIVATE-TOKEN" = $accessToken
}

# Define the branch details
$body = @{
    branch = "new-branch-name"
    ref    = "main"
} | ConvertTo-Json -Depth 10

# Create the branch
$response = Invoke-RestMethod -Uri $gitlabApiUrl -Headers $headers -Method Post -Body $body
Write-Host "Branch created successfully: $($response.name)"