# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and Detector ID
$region = "us-east-1"  # Replace with your desired AWS region
$detectorId = "1234567890abcdef0"  # Replace with your GuardDuty Detector ID

# Suspend GuardDuty
Update-GDDetector -DetectorId $detectorId -Enable $false -Region $region

Write-Host "GuardDuty has been suspended successfully for Detector ID '$detectorId' in region '$region'."
