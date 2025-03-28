# Define Salesforce API endpoint and token
$sfdcApiUrl = "https://your-instance.salesforce.com/services/data/vXX.X/sobjects/Account/"
$accessToken = "your-salesforce-access-token"
$recordId = "record-id-to-delete"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Delete the record
Invoke-RestMethod -Uri "$sfdcApiUrl/$recordId" -Headers $headers -Method Delete
Write-Host "Record with ID $recordId has been deleted."