# Define the chat platform webhook URL
$webhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Define the meeting reminder message payload
$reminderPayload = @{
    text = "Reminder: Team meeting at 3 PM today."
} | ConvertTo-Json

# Send the meeting reminder to the chat platform
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $reminderPayload -ContentType "application/json"