# Define the Skype API endpoint and access token
$apiEndpoint = "https://api.skype.com/v3/conversations/8:live:XXXXXXXXXXXX/messages"
$accessToken = "your_access_token"

# Define the message payload
$messagePayload = @{
    content = "Hello, this is a test message from PowerShell!"
} | ConvertTo-Json

# Send the message to Skype
Invoke-RestMethod -Uri $apiEndpoint -Method Post -Headers @{
    Authorization = "Bearer $accessToken"
} -Body $messagePayload -ContentType "application/json"