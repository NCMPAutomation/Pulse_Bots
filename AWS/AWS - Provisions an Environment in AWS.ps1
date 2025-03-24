# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and parameters
$region = "us-east-1"  # Replace with your desired AWS region
$vpcCidrBlock = "10.0.0.0/16"  # CIDR block for the VPC
$subnetCidrBlocks = @("10.0.1.0/24", "10.0.2.0/24")  # CIDR blocks for the subnets
$availabilityZones = @("us-east-1a", "us-east-1b")  # Availability zones for the subnets

# Create VPC
$vpc = New-EC2Vpc -CidrBlock $vpcCidrBlock -Region $region
Write-Host "VPC created with ID: $($vpc.VpcId)"

# Tag the VPC
New-EC2Tag -Resource $vpc.VpcId -Tag @{ Key = "Name"; Value = "MyVPC" } -Region $region

# Create an Internet Gateway
$igw = New-EC2InternetGateway -Region $region
Write-Host "Internet Gateway created with ID: $($igw.InternetGatewayId)"

# Attach the Internet Gateway to the VPC
Add-EC2InternetGateway -InternetGatewayId $igw.InternetGatewayId -VpcId $vpc.VpcId -Region $region

# Create a Route Table
$routeTable = New-EC2RouteTable -VpcId $vpc.VpcId -Region $region
Write-Host "Route Table created with ID: $($routeTable.RouteTableId)"

# Add a route to the Internet Gateway
New-EC2Route -RouteTableId $routeTable.RouteTableId -DestinationCidrBlock "0.0.0.0/0" -GatewayId $igw.InternetGatewayId -Region $region

# Create Subnets
for ($i = 0; $i -lt $subnetCidrBlocks.Count; $i++) {
    $subnet = New-EC2Subnet -VpcId $vpc.VpcId `
                            -CidrBlock $subnetCidrBlocks[$i] `
                            -AvailabilityZone $availabilityZones[$i] `
                            -Region $region
    Write-Host "Subnet created with ID: $($subnet.SubnetId)"
    
    # Tag the Subnet
    New-EC2Tag -Resource $subnet.SubnetId -Tag @{ Key = "Name"; Value = "Subnet-$i" } -Region $region

    # Associate the Subnet with the Route Table
    Add-EC2SubnetRouteTableAssociation -RouteTableId $routeTable.RouteTableId -SubnetId $subnet.SubnetId -Region $region
}

Write-Host "Environment provisioned successfully in region '$region'."
