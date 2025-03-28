# Define API endpoint
$ApiUrl = "https://api.example.com/health"
$AccessToken = "your-access-token"

# Schedule health check
while ($true) {
    $Headers = @{ Authorization = "Bearer $AccessToken" }
    $HealthStatus = Invoke-RestMethod -Uri $ApiUrl -Method Get -Headers $Headers
    Write-Output "API Health: $($HealthStatus.status)"
    Start-Sleep -Seconds 3600
}