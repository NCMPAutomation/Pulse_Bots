# Encrypt an email attachment using PGP before sending
$attachmentPath = "C:\Temp\SensitiveFile.docx"
$outputPath = "C:\Temp\EncryptedAttachment.pgp"
$recipientKey = "recipient@domain.com"

# Encrypt the file
gpg --output $outputPath --encrypt --recipient $recipientKey $attachmentPath

Write-Host "Attachment encrypted: $outputPath"