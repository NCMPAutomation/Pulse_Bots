# Define API endpoint and access token
$ApiUrl = "https://api.example.com/users"
$AccessToken = "your-access-token"

# Retrieve users
$Headers = @{ Authorization = "Bearer $AccessToken" }
$Users = Invoke-RestMethod -Uri $ApiUrl -Method Get -Headers $Headers
$Users | ForEach-Object { Write-Output $_ }