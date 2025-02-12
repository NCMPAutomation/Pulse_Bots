# Define variables
$token = "YOUR_GITHUB_TOKEN"
$repoName = "YOUR_REPO_NAME"
$userName = "YOUR_GITHUB_USERNAME"

# Create the repository
$body = @{
    name = $repoName
    private = $true
} | ConvertTo-Json

$headers = @{
    Authorization = "token $token"
    Accept = "application/vnd.github.v3+json"
}

$response = Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method Post -Headers $headers -Body $body

# Output the response
$response | Format-List