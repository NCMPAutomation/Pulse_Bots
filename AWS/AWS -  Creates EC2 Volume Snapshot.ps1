# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and volume parameters
$region = "us-east-1"  # Replace with your desired AWS region
$volumeId = "vol-1234567890abcdef0"  # Replace with your EC2 volume ID
$snapshotDescription = "Snapshot of volume $volumeId"  # Replace with your desired snapshot description

# Create a snapshot
$snapshot = New-EC2Snapshot -VolumeId $volumeId `
                             -Description $snapshotDescription `
                             -Region $region

# Output snapshot details
Write-Host "Snapshot created successfully."
Write-Host "Snapshot ID: $($snapshot.SnapshotId)"
Write-Host "Description: $($snapshot.Description)"
