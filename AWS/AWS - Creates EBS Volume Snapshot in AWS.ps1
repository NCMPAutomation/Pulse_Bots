# Set AWS Region
$Region = "Location" #example us-east-1

# Define parameters for the EBS Volume Snapshot
$VolumeId = "vol-0123456789abcdef0"          # Replace with your EBS Volume ID
$SnapshotDescription = "My EBS Volume Snapshot"  # Customize this description

# Create the EBS Volume Snapshot
$Snapshot = New-EC2Snapshot `
    -Region $Region `
    -VolumeId $VolumeId `
    -Description $SnapshotDescription

# Output the Snapshot ID
Write-Output "Snapshot created with Snapshot ID: $($Snapshot.SnapshotId)"
