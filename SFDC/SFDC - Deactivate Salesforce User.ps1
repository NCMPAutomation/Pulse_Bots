# Define Salesforce API endpoint and token
$sfdcApiUrl = "https://your-instance.salesforce.com/services/data/vXX.X/sobjects/User/"
$accessToken = "your-salesforce-access-token"
$userId = "user-id-to-deactivate"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Update the user's "IsActive" field to deactivate
$body = @{
    IsActive = $false
} | ConvertTo-Json -Depth 10

# Deactivate the user
Invoke-RestMethod -Uri "$sfdcApiUrl/$userId" -Headers $headers -Method Patch -Body $body
Write-Host "User with ID $userId has been deactivated."