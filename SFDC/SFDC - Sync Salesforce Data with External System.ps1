# Define Salesforce API endpoint and token
$sfdcApiUrl = "https://your-instance.salesforce.com/services/data/vXX.X/query/"
$accessToken = "your-salesforce-access-token"
$query = "SELECT Id, Name, Industry FROM Account"

# Define external database details
$externalDbPath = "C:\ExternalSystemData.csv"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Retrieve data from Salesforce
$response = Invoke-RestMethod -Uri "$sfdcApiUrl?q=$query" -Headers $headers -Method Get

# Export Salesforce data to external system (CSV file)
$response.records | Export-Csv -Path $externalDbPath -NoTypeInformation
Write-Host "Salesforce data synced to $externalDbPath."