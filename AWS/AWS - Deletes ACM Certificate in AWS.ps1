# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and ACM certificate ARN
$region = "us-east-1"  # Replace with your desired AWS region
$certificateArn = "arn:aws:acm:us-east-1:123456789012:certificate/abcd1234-abcd-1234-abcd-1234567890ab"  # Replace with your certificate ARN

# Delete the ACM certificate
Remove-ACMCertificate -CertificateArn $certificateArn -Region $region

Write-Host "ACM certificate with ARN '$certificateArn' has been deleted successfully in region '$region'."
