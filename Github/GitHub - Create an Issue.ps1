# Script to create a new issue in a GitHub repository

# Define variables
$token = "your_github_token"
$repoOwner = "repository_owner"
$repoName = "repository_name"
$title = "Issue title"
$body = "Issue description"

# Set the API URL
$apiUrl = "https://api.github.com/repos/$repoOwner/$repoName/issues"

# Create the request body
$requestBody = @{
    title = $title
    body = $body
} | ConvertTo-Json

# Make the API request
$response = Invoke-RestMethod -Method Post -Uri $apiUrl -Headers @{Authorization = "token $token"} -Body $requestBody

# Output success message
Write-Output "Issue '$title' created successfully."
