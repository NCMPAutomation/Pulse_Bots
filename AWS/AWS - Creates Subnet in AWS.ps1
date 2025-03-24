# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and subnet parameters
$region = "us-east-1"  # Replace with your desired AWS region
$vpcId = "vpc-12345678"  # Replace with your VPC ID
$cidrBlock = "10.0.1.0/24"  # Replace with the CIDR block for the subnet
$availabilityZone = "us-east-1a"  # Replace with the desired Availability Zone

# Create the subnet
$subnet = New-EC2Subnet -VpcId $vpcId `
                        -CidrBlock $cidrBlock `
                        -AvailabilityZone $availabilityZone `
                        -Region $region

# Add a name tag to the subnet
$tag = @{
    Key = "Name"
    Value = "MyCustomSubnet"  # Replace with your desired subnet name
}
New-EC2Tag -Resource $subnet.SubnetId -Tag $tag -Region $region

Write-Host "Subnet with ID '$($subnet.SubnetId)' created successfully in region '$region'."
