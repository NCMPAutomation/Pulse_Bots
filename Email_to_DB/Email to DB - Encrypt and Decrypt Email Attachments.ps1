# Encrypt and decrypt email attachments using AES
$Key = "MySecureKey123456" # 16-byte key
$SavePath = "C:\EmailAttachments"
foreach ($Email in $Emails) {
    foreach ($Attachment in $Email.Attachments) {
        $EncryptedFile = "$SavePath\Encrypted_$($Attachment.FileName)"
        $Data = [System.IO.File]::ReadAllBytes($Attachment.FileName)
        $EncryptedData = [System.Security.Cryptography.AesManaged]::Create().Encrypt($Data, $Key, $Key)
        [System.IO.File]::WriteAllBytes($EncryptedFile, $EncryptedData)
        Write-Output "Attachment Encrypted: $EncryptedFile"
    }
}