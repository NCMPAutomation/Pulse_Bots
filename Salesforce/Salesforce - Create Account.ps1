# Define Salesforce credentials and endpoints
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

# Define account data
$accountData = @{
    Name = "Acme Corporation"
    Industry = "Manufacturing"
    Phone = "123-456-7890"
    BillingStreet = "123 Main St"
    BillingCity = "Anytown"
    BillingState = "CA"
    BillingPostalCode = "12345"
    BillingCountry = "USA"
}

# Convert account data to JSON
$jsonAccountData = $accountData | ConvertTo-Json

# Create account
$response = Invoke-RestMethod -Method Post -Uri "$instanceUrl/services/data/v52.0/sobjects/Account" -Headers @{Authorization = "Bearer $accessToken"} -Body $jsonAccountData -ContentType "application/json"

# Output the result
Write-Output "New account created with ID: $($response.id)"
