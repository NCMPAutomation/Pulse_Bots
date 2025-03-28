# Create a new PGP key pair for encrypting and decrypting emails
$realName = "Your Name"
$email = "your@domain.com"
$passphrase = "StrongPassphrase123"

# Generate the key pair
gpg --batch --generate-key <<-EOF
    Key-Type: 1
    Key-Length: 2048
    Name-Real: $realName
    Name-Email: $email
    Passphrase: $passphrase
EOF

Write-Host "PGP key pair created for $email"