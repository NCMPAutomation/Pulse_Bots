# Define GitLab API endpoint and token
$gitlabApiUrl = "https://gitlab.com/api/v4/projects"
$accessToken = "your-gitlab-access-token"

# Set headers for the API call
$headers = @{
    "PRIVATE-TOKEN" = $accessToken
}

# Fetch the list of all projects
$response = Invoke-RestMethod -Uri $gitlabApiUrl -Headers $headers -Method Get

# Display project names and IDs
$response | ForEach-Object {
    Write-Host "Project Name: $($_.name), Project ID: $($_.id)"
}