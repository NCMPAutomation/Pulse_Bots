# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and instance parameters
$region = "us-east-1"  # Replace with your desired AWS region
$instanceId = "i-1234567890abcdef0"  # Replace with your EC2 instance ID

# Define logic to stop the instance
$currentTime = Get-Date
$stopTime = Get-Date -Hour 22 -Minute 0 -Second 0  # Set the stop time (e.g., 10:00 PM)

if ($currentTime -ge $stopTime) {
    # Stop the instance
    Stop-EC2Instance -InstanceId $instanceId -Region $region
    Write-Host "EC2 instance '$instanceId' has been stopped automatically at $currentTime."
} else {
    Write-Host "Current time is $currentTime. EC2 instance '$instanceId' will not be stopped yet."
}
