# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and Detector ID
$region = "us-east-1"  # Replace with your desired AWS region
$detectorId = "1234567890abcdef0"  # Replace with your GuardDuty Detector ID

# Delete the GuardDuty detector
Remove-GDDetector -DetectorId $detectorId -Region $region

Write-Host "GuardDuty with Detector ID '$detectorId' has been deleted successfully in region '$region'."
