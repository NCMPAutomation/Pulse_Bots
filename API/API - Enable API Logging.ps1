# Define API endpoint and log settings
$ApiUrl = "https://api.example.com/settings/logging"
$AccessToken = "your-access-token"
$LogSettings = @{
    enabled = $true
    retention_days = 30
}

# Enable logging
$Headers = @{ Authorization = "Bearer $AccessToken" }
Invoke-RestMethod -Uri $ApiUrl -Method Post -Headers $Headers -Body ($LogSettings | ConvertTo-Json)
Write-Output "API logging enabled."