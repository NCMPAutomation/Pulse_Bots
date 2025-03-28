# Define the chat platform webhook URL
$webhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Define the code deployment notification message payload
$deploymentPayload = @{
    text = "Code deployment to production was successful."
} | ConvertTo-Json

# Send the code deployment notification to the chat platform
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $deploymentPayload -ContentType "application/json"