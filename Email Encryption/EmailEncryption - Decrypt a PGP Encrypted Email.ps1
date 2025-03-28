# Decrypt a received PGP encrypted email
$encryptedFile = "C:\Temp\EncryptedMessage.asc"
$decryptedFile = "C:\Temp\DecryptedMessage.txt"

# Use your private key to decrypt the email
gpg --decrypt --output $decryptedFile $encryptedFile

Write-Host "Email decrypted successfully"