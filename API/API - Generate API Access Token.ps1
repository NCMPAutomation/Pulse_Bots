# Define API endpoint and credentials
$ApiUrl = "https://api.example.com/token"
$ClientId = "your-client-id"
$ClientSecret = "your-client-secret"

# Request access token
$Body = @{
    client_id = $ClientId
    client_secret = $ClientSecret
    grant_type = "client_credentials"
}

$TokenResponse = Invoke-RestMethod -Uri $ApiUrl -Method Post -Body $Body
Write-Output "Access Token: $($TokenResponse.access_token)"