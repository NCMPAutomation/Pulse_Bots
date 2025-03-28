# Load the mail profile and configure encryption settings
# This example assumes an Exchange account is used

# Define the encryption setting
$encryptionType = "S/MIME" # Options: S/MIME, PGP

Write-Host "Mail encryption type configured as: $encryptionType"