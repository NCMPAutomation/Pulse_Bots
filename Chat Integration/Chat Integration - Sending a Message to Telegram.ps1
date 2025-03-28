# Define the Telegram bot token and chat ID
$botToken = "XXXXXXXX:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
$chatId = "123456789"

# Define the message text
$messageText = "Hello, this is a test message from PowerShell!"

# Send the message to Telegram
Invoke-RestMethod -Uri "https://api.telegram.org/bot$botToken/sendMessage?chat_id=$chatId&text=$messageText" -Method Get