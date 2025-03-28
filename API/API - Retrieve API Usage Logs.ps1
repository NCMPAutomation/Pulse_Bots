# Define API endpoint and access token
$ApiUrl = "https://api.example.com/logs"
$AccessToken = "your-access-token"

# Retrieve usage logs
$Headers = @{ Authorization = "Bearer $AccessToken" }
$Logs = Invoke-RestMethod -Uri $ApiUrl -Method Get -Headers $Headers
$Logs | ForEach-Object { Write-Output $_ }