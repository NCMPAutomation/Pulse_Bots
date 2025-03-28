# Backup S/MIME certificates for email encryption
$outputPath = "C:\Temp\S_MIME_Certificates.pfx"

# Export certificates
$certs = Get-ChildItem Cert:\CurrentUser\My | Where-Object {
    $_.EnhancedKeyUsageList | Where-Object {$_.FriendlyName -eq "Secure Email"}
}
$certs | Export-PfxCertificate -FilePath $outputPath -Password (ConvertTo-SecureString "StrongPassword" -AsPlainText -Force)

Write-Host "S/MIME certificates exported successfully: $outputPath"