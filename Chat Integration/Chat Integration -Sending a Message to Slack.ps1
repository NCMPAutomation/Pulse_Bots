# Define the Slack webhook URL
$webhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Define the message payload
$messagePayload = @{
    text = "Hello, this is a test message from PowerShell!"
} | ConvertTo-Json

# Send the message to Slack
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $messagePayload -ContentType "application/json"