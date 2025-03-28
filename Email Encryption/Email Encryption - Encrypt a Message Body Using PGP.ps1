# Use GnuPG (GPG) to encrypt the message body with the recipient's PGP key
$recipientKey = "recipient@domain.com"
$message = "This is a sensitive message."

# Save message to a file
Set-Content -Path "C:\Temp\Message.txt" -Value $message

# Encrypt the message using the recipient's PGP public key
gpg --encrypt --recipient $recipientKey --output "C:\Temp\EncryptedMessage.asc" "C:\Temp\Message.txt"

Write-Host "Message encrypted successfully"