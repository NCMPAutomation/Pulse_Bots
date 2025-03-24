# Set AWS Region
$Region = "Location" #example us-east-1

# Define Placement Group parameters
$PlacementGroupName = "MyPlacementGroup"    # Replace with your Placement Group name
$Strategy = "cluster"                       # Options: cluster, partition, spread

# Create a Placement Group
New-EC2PlacementGroup `
    -Region $Region `
    -GroupName $PlacementGroupName `
    -Strategy $Strategy

# Define EC2 instance parameters
$InstanceType = "t2.micro"                  # Replace with your desired instance type
$AMIId = "ami-0123456789abcdef0"            # Replace with your desired Amazon Machine Image ID
$KeyName = "MyKeyPair"                      # Replace with your Key Pair name
$SecurityGroupIds = @("sg-0123456789abcdef0") # Replace with your Security Group ID
$SubnetId = "subnet-0123456789abcdef0"      # Replace with your Subnet ID

# Launch an EC2 instance in the Placement Group
$Instance = New-EC2Instance `
    -Region $Region `
    -InstanceType $InstanceType `
    -ImageId $AMIId `
    -KeyName $KeyName `
    -SecurityGroupIds $SecurityGroupIds `
    -SubnetId $SubnetId `
    -Placement_Tenancy "default" `
    -Placement_PlacementGroupName $PlacementGroupName

# Output instance details
Write-Output "EC2 instance created with Instance ID: $($Instance.Instances.InstanceId) in Placement Group: $PlacementGroupName"
