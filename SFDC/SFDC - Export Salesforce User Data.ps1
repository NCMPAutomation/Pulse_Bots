# Define Salesforce API endpoint and token
$sfdcApiUrl = "https://your-instance.salesforce.com/services/data/vXX.X/query/"
$accessToken = "your-salesforce-access-token"
$query = "SELECT Id, FirstName, LastName, Email FROM User"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Execute SOQL query to get user data
$response = Invoke-RestMethod -Uri "$sfdcApiUrl?q=$query" -Headers $headers -Method Get

# Export to a CSV file
$response.records | Export-Csv -Path "C:\UsersData.csv" -NoTypeInformation
Write-Host "User data exported to C:\UsersData.csv"