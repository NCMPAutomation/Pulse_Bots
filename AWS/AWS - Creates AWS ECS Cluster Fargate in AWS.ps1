# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and cluster name
$region = "location"  # Replace with your desired AWS region
$clusterName = "MyFargateCluster"  # Replace with your desired ECS cluster name

# Create the ECS Cluster
New-ECSCluster -ClusterName $clusterName -Region $region

Write-Host "ECS Fargate Cluster '$clusterName' created successfully in region '$region'."
