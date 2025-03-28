# Define Salesforce API endpoint and token
$sfdcApiUrl = "https://your-instance.salesforce.com/services/data/vXX.X/sobjects/User/"
$accessToken = "your-salesforce-access-token"

# Set headers for the API call
$headers = @{
    Authorization = "Bearer $accessToken"
    "Content-Type" = "application/json"
}

# Define the new user's information
$body = @{
    FirstName = "John"
    LastName  = "Doe"
    Email     = "johndoe@example.com"
    Username  = "johndoe@example.com"
    Alias     = "jdoe"
    ProfileId = "your-profile-id"
    LocaleSidKey = "en_US"
    EmailEncodingKey = "UTF-8"
    TimeZoneSidKey = "America/New_York"
} | ConvertTo-Json -Depth 10

# Create the user
$response = Invoke-RestMethod -Uri $sfdcApiUrl -Headers $headers -Method Post -Body $body
Write-Host "New user created with ID: $($response.id)"