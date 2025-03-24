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

# Define opportunity data
$opportunityData = @{
    Name = "New Business Deal"
    CloseDate = "2025-12-31"
    StageName = "Prospecting"
    Amount = 50000
    AccountId = "001xx000003DGbYAAW"  # Replace with a valid Account ID
}

# Convert opportunity data to JSON
$jsonOpportunityData = $opportunityData | ConvertTo-Json

# Create opportunity
$response = Invoke-RestMethod -Method Post -Uri "$instanceUrl/services/data/v52.0/sobjects/Opportunity" -Headers @{Authorization = "Bearer $accessToken"} -Body $jsonOpportunityData -ContentType "application/json"

# Output the result
Write-Output "New opportunity created with ID: $($response.id)"