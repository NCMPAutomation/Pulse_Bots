# Define the chat platform webhook URL
$webhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Define the holiday greeting message payload
$greetingPayload = @{
    text = "Happy Holidays! Wishing you a joyful season."
} | ConvertTo-Json

# Send the holiday greeting to the chat platform
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $greetingPayload -ContentType "application/json"