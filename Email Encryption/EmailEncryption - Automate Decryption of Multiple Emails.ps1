# Batch decrypt multiple PGP-encrypted emails
$inputFolder = "C:\Temp\EncryptedEmails"
$outputFolder = "C:\Temp\DecryptedEmails"

# Loop through all encrypted files in the folder
Get-ChildItem $inputFolder -Filter "*.asc" | ForEach-Object {
    $outputFile = Join-Path $outputFolder ($_.BaseName + ".txt")
    gpg --decrypt --output $outputFile $_.FullName
    Write-Host "Decrypted: $($_.Name)"
}