# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region
$region = "us-east-1"  # Replace with your desired AWS region

# Get information about all EBS volumes
$volumes = Get-EC2Volume -Region $region

# Display volume details
Write-Host "EBS Volume Information in region '$region':"
foreach ($volume in $volumes.Volumes) {
    Write-Host "Volume ID: $($volume.VolumeId)"
    Write-Host "State: $($volume.State)"
    Write-Host "Size (GiB): $($volume.Size)"
    Write-Host "Type: $($volume.VolumeType)"
    Write-Host "Availability Zone: $($volume.AvailabilityZone)"
    Write-Host "Snapshot ID (if any): $($volume.SnapshotId)"
    Write-Host "Tags: $($volume.Tags | ForEach-Object { "$($_.Key)=$($_.Value)" })"
    Write-Host "----------------------------------------"
}
