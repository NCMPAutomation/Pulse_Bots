# Define API endpoint and rate limit settings
$ApiUrl = "https://api.example.com/settings/rate-limits"
$AccessToken = "your-access-token"
$RateLimits = @{
    max_requests_per_minute = 100
}

# Set rate limits
$Headers = @{ Authorization = "Bearer $AccessToken" }
Invoke-RestMethod -Uri $ApiUrl -Method Post -Headers $Headers -Body ($RateLimits | ConvertTo-Json)
Write-Output "Rate limits updated."