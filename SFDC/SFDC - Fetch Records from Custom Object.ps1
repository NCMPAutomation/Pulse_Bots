# Define Salesforce API endpoint and token
$sfdcApiUrl = "https://your-instance.salesforce.com/services/data/vXX.X/query/"
$accessToken = "your-salesforce-access-token"
$query = "SELECT CustomField1, CustomField2 FROM CustomObject__c"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Query records from custom object
$response = Invoke-RestMethod -Uri "$sfdcApiUrl?q=$query" -Headers $headers -Method Get

# Display the fetched records
$response.records | ForEach-Object {
    Write-Host "Field1: $($_.CustomField1), Field2: $($_.CustomField2)"
}