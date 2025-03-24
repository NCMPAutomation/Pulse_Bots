# Define Salesforce credentials and endpoint
$instanceUrl = "https://yourInstance.salesforce.com"
$clientId = "yourClientId"
$clientSecret = "yourClientSecret"
$refreshToken = "yourRefreshToken"

# Function to get access token
function Get-AccessToken {
    $body = @{
        grant_type    = "refresh_token"
        client_id     = $clientId
        client_secret = $clientSecret
        refresh_token = $refreshToken
    }
    $response = Invoke-RestMethod -Method Post -Uri "$instanceUrl/services/oauth2/token" -Body $body
    return $response.access_token
}

# Get access token
$accessToken = Get-AccessToken

# Define contact data
$contactData = @{
    FirstName = "Jane"
    LastName  = "Smith"
    Email     = "jane.smith@example.com"
    Phone     = "987-654-3210"
    AccountId = "001xx000003DGbYAAW"  # Replace with a valid Account ID
}

# Convert contact data to JSON
$jsonContactData = $contactData | ConvertTo-Json

# Create contact
$response = Invoke-RestMethod -Method Post -Uri "$instanceUrl/services/data/v52.0/sobjects/Contact" -Headers @{Authorization = "Bearer $accessToken"} -Body $jsonContactData -ContentType "application/json"

# Output the result
Write-Output "New contact created with ID: $($response.id)"