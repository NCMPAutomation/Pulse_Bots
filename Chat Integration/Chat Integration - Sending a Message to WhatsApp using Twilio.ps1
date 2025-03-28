# Define the Twilio account SID, auth token, and WhatsApp number
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
$authToken = "your_auth_token"
$fromNumber = "whatsapp:+14155238886"
$toNumber = "whatsapp:+1234567890"

# Define the message text
$messageText = "Hello, this is a test message from PowerShell!"

# Send the message to WhatsApp
Invoke-RestMethod -Uri "https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json" -Method Post -Headers @{
    Authorization = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$accountSid:$authToken"))
} -Body @{
    From = $fromNumber
    To = $toNumber
    Body = $messageText
}