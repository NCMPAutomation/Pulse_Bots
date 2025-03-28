# Define Salesforce API endpoint and token
$sfdcApiUrl = "https://your-instance.salesforce.com/services/data/vXX.X/query/"
$accessToken = "your-salesforce-access-token"
$query = "SELECT Username, LoginTime, SourceIp FROM LoginHistory"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Retrieve login activity
$response = Invoke-RestMethod -Uri "$sfdcApiUrl?q=$query" -Headers $headers -Method Get

# Display login activity details
$response.records | ForEach-Object {
    Write-Host "User: $($_.Username), Login Time: $($_.LoginTime), Source IP: $($_.SourceIp)"
}