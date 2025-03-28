# Define the chat platform webhook URL
$webhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Define the customer onboarding message payload
$onboardingPayload = @{
    text = "Welcome to our service! Here are some resources to get you started: https://example.com/resources"
} | ConvertTo-Json

# Send the customer onboarding message to the chat platform
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $onboardingPayload -ContentType "application/json"