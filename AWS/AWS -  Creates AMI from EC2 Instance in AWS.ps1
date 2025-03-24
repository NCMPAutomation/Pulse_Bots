# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and EC2 instance parameters
$region = "us-east-1"  # Replace with your desired AWS region
$instanceId = "i-1234567890abcdef0"  # Replace with your EC2 instance ID
$imageName = "MyCustomAMI"  # Replace with your desired AMI name
$imageDescription = "Custom AMI created from EC2 instance"  # Replace with your desired description

# Create the AMI from the EC2 instance
$ami = New-EC2Image -InstanceId $instanceId `
                    -Name $imageName `
                    -Description $imageDescription `
                    -NoReboot `
                    -Region $region

Write-Host "AMI with ID '$($ami.ImageId)' created successfully from instance ID '$instanceId' in region '$region'."

