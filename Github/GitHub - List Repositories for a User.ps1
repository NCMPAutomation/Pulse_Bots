# Script to list all repositories for a GitHub user

# Define variables
$token = "your_github_token"
$username = "github_username"

# Set the API URL
$apiUrl = "https://api.github.com/users/$username/repos"

# Make the API request
$response = Invoke-RestMethod -Method Get -Uri $apiUrl -Headers @{Authorization = "token $token"}

# Output repository names
$response | ForEach-Object { Write-Output $_.name }
