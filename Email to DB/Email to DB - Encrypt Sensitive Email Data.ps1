# Encrypt email content before database insertion
$EmailContent = $Email.Body
$EncryptedContent = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($EmailContent))
Write-Output "Encrypted Email Body: $EncryptedContent"