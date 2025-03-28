# Find and verify the S/MIME encryption certificate for an email recipient
$recipientEmail = "example@domain.com"

# Search the local certificate store for the recipient's encryption certificate
$certs = Get-ChildItem Cert:\CurrentUser\My | Where-Object {
    $_.Subject -match $recipientEmail -and $_.EnhancedKeyUsageList | Where-Object {$_.FriendlyName -eq "Secure Email"}
}

if ($certs) {
    Write-Host "Encryption certificate found for $recipientEmail"
} else {
    Write-Host "No encryption certificate found for $recipientEmail"
}