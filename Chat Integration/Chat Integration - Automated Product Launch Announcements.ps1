# Define the chat platform webhook URL
$webhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Define the product launch announcement message payload
$launchPayload = @{
    text = "We're excited to announce the launch of our new product! Check it out here: https://example.com/product"
} | ConvertTo-Json

# Send the product launch announcement to the chat platform
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $launchPayload -ContentType "application/json"