# Define the chat platform webhook URL
$webhookUrl = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Define the survey message payload
$surveyPayload = @{
    text = "Please take a moment to complete our survey: https://example.com/survey"
} | ConvertTo-Json

# Send the survey message to the chat platform
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $surveyPayload -ContentType "application/json"