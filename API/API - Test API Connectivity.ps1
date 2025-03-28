# Define API endpoint and access token
$ApiUrl = "https://api.example.com/endpoint"
$AccessToken = "your-access-token"

# Test connectivity
$Headers = @{ Authorization = "Bearer $AccessToken" }
$Response = Invoke-RestMethod -Uri $ApiUrl -Method Get -Headers $Headers
Write-Output $Response