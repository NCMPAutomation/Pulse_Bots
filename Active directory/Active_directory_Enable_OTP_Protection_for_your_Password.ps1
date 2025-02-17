# Install the OtpAuth module if not already installed
Install-Module -Name OtpAuth -Verbose

# Import the OtpAuth module
Import-Module OtpAuth

# Initialize the credential store
Initialize-OtpAuthCredentialStore

# Import credentials from a QR code image (replace with your QR code path)
Import-OtpAuthCredential -Path "path/to/your/qr-code.png"

# Generate an OTP code
Get-OtpAuthCode -Credential (Get-OtpAuthCredential -Issuer "YourIssuerName")

# Output the OTP code
Write-Output "Your OTP code is: $otpCode"
