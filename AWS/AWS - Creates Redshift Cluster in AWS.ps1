# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and parameters
$region = "location"  # Replace with your desired region
$clusterIdentifier = "my-redshift-cluster"  # Replace with your desired cluster name
$nodeType = "dc2.large"  # Replace with your desired node type
$masterUsername = "admin"  # Replace with your desired master username
$masterUserPassword = "YourSecurePassword123!"  # Replace with your desired master password
$clusterType = "multi-node"  # Use "single-node" for a single-node cluster
$numberOfNodes = 2  # Specify the number of nodes (minimum 2 for multi-node)

# Create Redshift Cluster
New-RSCluster -ClusterIdentifier $clusterIdentifier `
              -NodeType $nodeType `
              -MasterUsername $masterUsername `
              -MasterUserPassword $masterUserPassword `
              -ClusterType $clusterType `
              -NumberOfNodes $numberOfNodes `
              -Region $region

Write-Host "Redshift cluster creation initiated. Cluster Identifier: $clusterIdentifier"
