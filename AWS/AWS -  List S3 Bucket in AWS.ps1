# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region
$region = "us-east-1"  # Replace with your desired AWS region

# List all S3 buckets
$buckets = Get-S3Bucket -Region $region

# Display bucket details
Write-Host "S3 Buckets in region '$region':"
foreach ($bucket in $buckets) {
    Write-Host "Bucket Name: $($bucket.BucketName) | Creation Date: $($bucket.CreationDate)"
}
