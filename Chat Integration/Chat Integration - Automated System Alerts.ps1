# Define the chat platform webhook URL
$webhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Define the system alert message payload
$alertPayload = @{
    text = "System Alert: CPU usage has exceeded 90%."
} | ConvertTo-Json

# Send the system alert to the chat platform
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $alertPayload -ContentType "application/json"