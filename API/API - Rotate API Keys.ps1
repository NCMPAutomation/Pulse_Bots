# Define API endpoint and key details
$ApiUrl = "https://api.example.com/keys/rotate"
$AccessToken = "your-access-token"

# Rotate API key
$Headers = @{ Authorization = "Bearer $AccessToken" }
$NewKey = Invoke-RestMethod -Uri $ApiUrl -Method Post -Headers $Headers
Write-Output "New API Key: $($NewKey.key)"