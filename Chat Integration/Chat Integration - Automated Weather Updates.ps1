# Define the chat platform webhook URL
$webhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Get the weather update
$weatherUpdate = Invoke-RestMethod -Uri "https://api.weatherapi.com/v1/current.json?key=YOUR_API_KEY&q=London"

# Define the weather update message payload
$weatherPayload = @{
    text = "Current weather in London: $($weatherUpdate.current.condition.text), $($weatherUpdate.current.temp_c)°C"
} | ConvertTo-Json

# Send the weather update to the chat platform
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $weatherPayload -ContentType "application/json"