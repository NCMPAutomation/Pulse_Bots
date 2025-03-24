# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and cluster parameters
$region = "location"  # Replace with your desired AWS region
$clusterName = "MyECSCluster"  # Replace with your desired ECS cluster name

# Create ECS Cluster
New-ECSCluster -ClusterName $clusterName -Region $region

Write-Host "ECS Cluster '$clusterName' created successfully in region '$region'."
