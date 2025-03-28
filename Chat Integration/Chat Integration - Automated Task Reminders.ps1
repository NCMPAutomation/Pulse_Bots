# Define the chat platform webhook URL
$webhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Define the task reminder message payload
$taskPayload = @{
    text = "Reminder: Complete the quarterly report by EOD."
} | ConvertTo-Json

# Send the task reminder to the chat platform
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $taskPayload -ContentType "application/json"