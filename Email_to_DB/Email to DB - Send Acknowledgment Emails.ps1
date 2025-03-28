# Send acknowledgment emails for processed items
$AckEmail = $Outlook.CreateItem(0) # New email
$AckEmail.To = $Email.SenderEmailAddress
$AckEmail.Subject = "Acknowledgment of Your Email"
$AckEmail.Body = "Your email has been processed successfully."
$AckEmail.Send()
Write-Output "Acknowledgment Sent"