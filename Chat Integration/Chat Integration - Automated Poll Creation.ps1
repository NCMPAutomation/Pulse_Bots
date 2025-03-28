# Define the chat platform webhook URL
$webhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Define the poll message payload
$pollPayload = @{
    text = "Poll: What should we have for lunch? \n1. Pizza \n2. Sushi \n3. Salad"
} | ConvertTo-Json

# Send the poll message to the chat platform
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $pollPayload -ContentType "application/json"