# Define variables
$token = "YOUR_GITHUB_TOKEN"
$repoOwner = "YOUR_REPO_OWNER"
$repoName = "YOUR_REPO_NAME"
$headers = @{
    Authorization = "token $token"
    Accept = "application/vnd.github.v3+json"
}
try {
    # Delete the repository
    $response = Invoke-RestMethod -Uri "https://api.github.com/repos/$repoOwner/$repoName" -Method Delete -Headers $headers
    Write-Output "Repository deleted successfully."
} catch {
    Write-Error "Failed to delete the repository. Status code: $($_.Exception.Response.StatusCode)"
    Write-Error "Error message: $($_.Exception.Message)"
}
has context menu