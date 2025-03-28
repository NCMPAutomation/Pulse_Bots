# Define the Discord webhook URL
$webhookUrl = "https://discord.com/api/webhooks/XXXXXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

# Define the message payload
$messagePayload = @{
    content = "Hello, this is a test message from PowerShell!"
} | ConvertTo-Json

# Send the message to Discord
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $messagePayload -ContentType "application/json"