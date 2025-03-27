# Script to list all collaborators for a GitHub repository

# Define variables
$token = "your_github_token"
$repoOwner = "repository_owner"
$repoName = "repository_name"

# Set the API URL
$apiUrl = "https://api.github.com/repos/$repoOwner/$repoName/collaborators"

# Make the API request
$response = Invoke-RestMethod -Method Get -Uri $apiUrl -Headers @{Authorization = "token $token"}

# Output collaborator usernames
$response | ForEach-Object { Write-Output $_.login }
