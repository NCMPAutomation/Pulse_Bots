# Define the Microsoft Teams webhook URL
$webhookUrl = "https://outlook.office.com/webhook/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX@XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/IncomingWebhook/XXXXXXXXXXXXXX/XXXXXXXXXXXXXX"

# Define the message payload
$messagePayload = @{
    text = "Hello, this is a test message from PowerShell!"
} | ConvertTo-Json

# Send the message to Microsoft Teams
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $messagePayload -ContentType "application/json"