# Define GitLab API endpoint and token
$gitlabApiUrl = "https://gitlab.com/api/v4/projects/your-project-id/pipeline"
$accessToken = "your-gitlab-access-token"

# Set headers for the API call
$headers = @{
    "PRIVATE-TOKEN" = $accessToken
}

# Define pipeline trigger parameters
$body = @{
    ref = "main"  # Branch to trigger the pipeline
} | ConvertTo-Json -Depth 10

# Trigger the pipeline
$response = Invoke-RestMethod -Uri $gitlabApiUrl -Headers $headers -Method Post -Body $body
Write-Host "Pipeline triggered successfully with ID: $($response.id)"