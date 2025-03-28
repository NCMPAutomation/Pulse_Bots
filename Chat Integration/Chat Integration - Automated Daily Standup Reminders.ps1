# Define the chat platform webhook URL
$webhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Define the daily standup reminder message payload
$standupPayload = @{
    text = "Reminder: Daily standup meeting at 10 AM."
} | ConvertTo-Json

# Send the daily standup reminder to the chat platform
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $standupPayload -ContentType "application/json"