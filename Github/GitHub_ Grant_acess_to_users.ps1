# Define variables
$token = "YOUR_GITHUB_TOKEN"
$repoOwner = "YOUR_REPO_OWNER"
$repoName = "YOUR_REPO_NAME"
$userName = "USER_TO_GRANT_ACCESS"  # this has to be github account holder's username(not email)
$permission = "push"  # Options: pull, push, admin

# Create the request body
$body = @{
    permission = $permission
} | ConvertTo-Json

$headers = @{
    Authorization = "token $token"
    Accept = "application/vnd.github.v3+json"
}

try {
    # Grant access to the user
    $response = Invoke-RestMethod -Uri "https://api.github.com/repos/$repoOwner/$repoName/collaborators/$userName" -Method Put -Headers $headers -Body $body
    Write-Output "Access granted successfully."
    $response | Format-List
} catch {
    Write-Error "Failed to grant access. Status code: $($_.Exception.Response.StatusCode)"
    Write-Error "Error message: $($_.Exception.Message)"
}