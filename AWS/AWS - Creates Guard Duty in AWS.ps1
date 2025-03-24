# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region
$region = "us-east-1"  # Replace with your desired AWS region

# Enable GuardDuty in the specified region
$detector = New-GDDetector -Enable -Region $region

# Output Detector ID
Write-Host "GuardDuty has been enabled successfully."
Write-Host "Detector ID: $($detector.DetectorId)"
