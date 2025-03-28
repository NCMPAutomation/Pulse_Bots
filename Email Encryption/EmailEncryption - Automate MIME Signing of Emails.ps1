# Automate the signing of an email using S/MIME
$emailAddress = "user@domain.com"

# Find the signing certificate
$cert = Get-ChildItem Cert:\CurrentUser\My | Where-Object {
    $_.Subject -match $emailAddress -and $_.EnhancedKeyUsageList | Where-Object {$_.FriendlyName -eq "Secure Email"}
}

if ($cert) {
    Write-Host "Signing certificate found for $emailAddress"
    # Use the certificate to sign an outgoing email (requires mail-sending script integration)
} else {
    Write-Host "No signing certificate found for $emailAddress"
}