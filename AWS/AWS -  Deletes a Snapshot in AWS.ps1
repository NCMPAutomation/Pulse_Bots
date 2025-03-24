# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and snapshot ID
$region = "us-east-1"  # Replace with your desired AWS region
$snapshotId = "snap-1234567890abcdef0"  # Replace with your EBS snapshot ID

# Delete the snapshot
Remove-EC2Snapshot -SnapshotId $snapshotId -Region $region

Write-Host "Snapshot with ID '$snapshotId' has been deleted successfully in region '$region'."
