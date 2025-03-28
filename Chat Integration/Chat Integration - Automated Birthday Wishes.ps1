# Define the chat platform webhook URL
$webhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Define the birthday wishes message payload
$birthdayPayload = @{
    text = "Happy Birthday, John! 🎉"
} | ConvertTo-Json

# Send the birthday wishes to the chat platform
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $birthdayPayload -ContentType "application/json"