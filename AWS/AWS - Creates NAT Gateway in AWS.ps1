# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and NAT Gateway parameters
$region = "us-east-1"  # Replace with your desired AWS region
$subnetId = "subnet-12345678"  # Replace with the subnet ID where the NAT Gateway will reside
$allocationId = "eipalloc-12345678"  # Replace with the Elastic IP Allocation ID for the NAT Gateway

# Create the NAT Gateway
$natGateway = New-EC2NatGateway -SubnetId $subnetId `
                                 -AllocationId $allocationId `
                                 -Region $region

# Output NAT Gateway details
Write-Host "NAT Gateway with ID '$($natGateway.NatGatewayId)' created successfully in region '$region'."
