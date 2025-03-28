# Define Salesforce API endpoint and token
$sfdcApiUrl = "https://your-instance.salesforce.com/services/data/vXX.X/sobjects/UserRole/"
$accessToken = "your-salesforce-access-token"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Fetch all roles
$response = Invoke-RestMethod -Uri "$sfdcApiUrl" -Headers $headers -Method Get

# Display available roles
$response.records | ForEach-Object {
    Write-Host "Role Name: $($_.Name), Role ID: $($_.Id)"
}