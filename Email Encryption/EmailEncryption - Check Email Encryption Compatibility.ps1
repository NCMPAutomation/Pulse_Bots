# Verify if the recipient supports email encryption
$recipientEmail = "example@domain.com"

# Check certificate and PGP public key availability
$certCheck = Get-ChildItem Cert:\CurrentUser\My | Where-Object {
    $_.Subject -match $recipientEmail -and $_.EnhancedKeyUsageList | Where-Object {$_.FriendlyName -eq "Secure Email"}
}

$pgpKeyCheck = gpg --list-keys $recipientEmail

if ($certCheck -or $pgpKeyCheck) {
    Write-Host "The recipient supports email encryption"
} else {
    Write-Host "The recipient does not support encryption"
}