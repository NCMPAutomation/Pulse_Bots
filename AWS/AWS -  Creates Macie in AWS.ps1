# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region
$region = "us-east-1"  # Replace with your desired AWS region

# Enable Macie
$macie = Enable-Macie -Region $region

Write-Host "Amazon Macie has been enabled successfully in region '$region'."
