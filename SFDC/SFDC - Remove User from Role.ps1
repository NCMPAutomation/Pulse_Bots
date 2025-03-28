# Define Salesforce API endpoint and token
$sfdcApiUrl = "https://your-instance.salesforce.com/services/data/vXX.X/sobjects/User/"
$accessToken = "your-salesforce-access-token"
$userId = "user-id-to-remove-role"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Update the user to remove their role assignment
$body = @{
    UserRoleId = $null  # Reset the UserRoleId field to remove the role
} | ConvertTo-Json -Depth 10

# Remove the role from the user
Invoke-RestMethod -Uri "$sfdcApiUrl/$userId" -Headers $headers -Method Patch -Body $body
Write-Host "Role removed for user with ID $userId."