# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and certificate parameters
$region = "us-east-1"  # Replace with your desired AWS region
$domainName = "example.com"  # Replace with your domain name
$subjectAlternativeNames = @("www.example.com", "api.example.com")  # Add additional domain names, if needed

# Request an ACM certificate
$certificate = New-ACMCertificate -DomainName $domainName `
                                   -SubjectAlternativeName $subjectAlternativeNames `
                                   -ValidationMethod "DNS" `
                                   -Region $region

# Output certificate details
Write-Host "ACM certificate request created successfully."
Write-Host "Certificate ARN: $($certificate.CertificateArn)"
