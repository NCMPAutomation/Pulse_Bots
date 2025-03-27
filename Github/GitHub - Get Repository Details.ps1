# Script to get details of a specific GitHub repository

# Define variables
$token = "your_github_token"
$repoOwner = "repository_owner"
$repoName = "repository_name"

# Set the API URL
$apiUrl = "https://api.github.com/repos/$repoOwner/$repoName"

# Make the API request
$response = Invoke-RestMethod -Method Get -Uri $apiUrl -Headers @{Authorization = "token $token"}

# Output repository details
$response | Format-List
