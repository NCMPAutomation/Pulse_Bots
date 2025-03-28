# Define API endpoint and user ID
$ApiUrl = "https://api.example.com/users/{userId}"
$AccessToken = "your-access-token"

# Revoke access
$Headers = @{ Authorization = "Bearer $AccessToken" }
Invoke-RestMethod -Uri $ApiUrl -Method Delete -Headers $Headers
Write-Output "User access revoked."