# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and instance parameters
$region = "location"  # Replace with your desired AWS region
$instanceType = "t2.micro"  # Replace with your desired instance type
$amiId = "ami-0c2b8ca1dad447f8a"  # Replace with the Amazon Linux 2 AMI ID for your region
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
Write-Host "Amazon Linux EC2 instance launched successfully."
Write-Host "Instance ID: $($instance.Instances[0].InstanceId)"
Write-Host "Public DNS: $($instance.Instances[0].PublicDnsName)"
