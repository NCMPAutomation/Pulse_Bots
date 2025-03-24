# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and VPC parameters
$region = "location"  # Replace with your desired AWS region
$cidrBlock = "10.0.0.0/16"  # Replace with your desired CIDR block for the VPC

# Create the VPC
$vpc = New-EC2Vpc -CidrBlock $cidrBlock -Region $region

# Add a name tag to the VPC
$tag = @{
    Key = "Name"
    Value = "MyCustomVPC"  # Replace with your desired VPC name
}
New-EC2Tag -Resource $vpc.VpcId -Tag $tag -Region $region

Write-Host "VPC with ID '$($vpc.VpcId)' created successfully in region '$region'."
