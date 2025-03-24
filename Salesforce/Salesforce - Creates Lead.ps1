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

# Define lead data
$leadData = @{
    FirstName = "John"
    LastName  = "Doe"
    Company   = "Doe Enterprises"
    Email     = "john.doe@example.com"
    Phone     = "123-456-7890"
    LeadSource = "Web"
}

# Convert lead data to JSON
$jsonLeadData = $leadData | ConvertTo-Json

# Create lead
$response = Invoke-RestMethod -Method Post -Uri "$instanceUrl/services/data/v52.0/sobjects/Lead" -Headers @{Authorization = "Bearer $accessToken"} -Body $jsonLeadData -ContentType "application/json"

# Output the result
Write-Output "New lead created with ID: $($response.id)"