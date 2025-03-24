# Define Salesforce credentials and endpoints
$clientId = "your_client_id"
$clientSecret = "your_client_secret"
$username = "your_salesforce_username"
$password = "your_salesforce_password"
$securityToken = "your_security_token"
$loginUrl = "https://login.salesforce.com/services/oauth2/token"
$instanceUrl = "https://your_instance.salesforce.com"

# Obtain access token
$response = Invoke-RestMethod -Method Post -Uri $loginUrl -Body @{
    grant_type    = "password"
    client_id     = $clientId
    client_secret = $clientSecret
    username      = $username
    password      = "$password$securityToken"
}

$accessToken = $response.access_token
$instanceUrl = $response.instance_url

# Define the new user details
$newUser = @{
    Username       = "newuser@example.com"
    LastName       = "Doe"
    FirstName      = "John"
    Email          = "newuser@example.com"
    Alias          = "jdoe"
    TimeZoneSidKey = "America/Los_Angeles"
    LocaleSidKey   = "en_US"
    EmailEncodingKey = "UTF-8"
    ProfileId      = "your_profile_id"
    LanguageLocaleKey = "en_US"
}

# Convert the user details to JSON
$newUserJson = $newUser | ConvertTo-Json

# Create the new user
$userCreationUrl = "$instanceUrl/services/data/v52.0/sobjects/User/"
$response = Invoke-RestMethod -Method Post -Uri $userCreationUrl -Headers @{
    "Authorization" = "Bearer $accessToken"
    "Content-Type"  = "application/json"
} -Body $newUserJson

# Output the response
$response