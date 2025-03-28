# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/users"
$apiToken = "your-okta-api-token"
$userId = "user-id-to-notify"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Define the custom notification message
$body = @{
    message = "This is a custom notification from your admin."
} | ConvertTo-Json -Depth 10

# Send the notification
Invoke-RestMethod -Uri "$apiUrl/$userId/lifecycle/notification" -Headers $headers -Method Post -Body $body
Write-Host "Notification sent to user with ID $userId."