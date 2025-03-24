# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and instance parameters
$region = "us-east-1"  # Replace with your desired AWS region
$instanceType = "t2.micro"  # Replace with your desired instance type
$amiId = "ami-0a4a70bd98c6d6441"  # Replace with the AMI ID for RHEL (Example: RHEL 8 in us-east-1)
$keyName = "MyKeyPair"  # Replace with your existing key pair name
$securityGroupId = "sg-12345678"  # Replace with your security group ID
$subnetId = "subnet-12345678"  # Replace with your subnet ID

# Launch EC2 instance
$instance = New-EC2Instance -ImageId $amiId `
                             -InstanceType $instanceType `
                             -KeyName $keyName `
                             -SecurityGroupId $securityGroupId `
                             -SubnetId $subnetId `
                             -MinCount 1 -MaxCount 1 `
                             -Region $region

# Output instance details
Write-Host "Red Hat Enterprise Linux EC2 instance launched successfully."
Write-Host "Instance ID: $($instance.Instances[0].InstanceId)"
Write-Host "Public DNS: $($instance.Instances[0].PublicDnsName)"
