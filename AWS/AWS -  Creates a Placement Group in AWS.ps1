# Set AWS Region
$Region = "Location" #example us-east-1

# Define parameters for the Placement Group
$PlacementGroupName = "MyPlacementGroup"   # Replace with your desired name
$Strategy = "cluster"                     # Options: cluster, partition, spread

# Create the Placement Group
New-EC2PlacementGroup `
    -Region $Region `
    -GroupName $PlacementGroupName `
    -Strategy $Strategy

# Output the details of the created Placement Group
Write-Output "Placement Group '$PlacementGroupName' created with strategy '$Strategy' in region '$Region'."
