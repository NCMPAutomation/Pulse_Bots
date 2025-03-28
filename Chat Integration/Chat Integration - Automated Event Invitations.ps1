# Define the chat platform webhook URL
$webhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Define the event invitation message payload
$eventPayload = @{
    text = "You're invited to the company picnic on Saturday at 12 PM. RSVP here: https://example.com/rsvp"
} | ConvertTo-Json

# Send the event invitation to the chat platform
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $eventPayload -ContentType "application/json"
