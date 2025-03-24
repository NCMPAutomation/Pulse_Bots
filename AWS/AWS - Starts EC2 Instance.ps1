# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and instance ID
$region = "us-east-1"  # Replace with your desired AWS region
$instanceId = "i-1234567890abcdef0"  # Replace with your EC2 instance ID

# Start the EC2 instance
Start-EC2Instance -InstanceId $instanceId -Region $region

Write-Host "EC2 instance '$instanceId' has been started successfully in region '$region'."
