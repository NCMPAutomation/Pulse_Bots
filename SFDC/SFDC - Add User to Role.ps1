# Define Salesforce API endpoint and token
$sfdcApiUrl = "https://your-instance.salesforce.com/services/data/vXX.X/sobjects/User/"
$accessToken = "your-salesforce-access-token"
$userId = "user-id"
$roleId = "role-id"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Update the user's role
$body = @{
    UserRoleId = $roleId
} | ConvertTo-Json -Depth 10

# Assign the role to the user
Invoke-RestMethod -Uri "$sfdcApiUrl/$userId" -Headers $headers -Method Patch -Body $body
Write-Host "User with ID $userId has been assigned to Role ID $roleId."