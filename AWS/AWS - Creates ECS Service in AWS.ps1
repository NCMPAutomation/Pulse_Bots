# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and service parameters
$region = "location"  # Replace with your desired region
$clusterName = "MyECSCluster"  # Replace with your ECS cluster name
$serviceName = "MyECSService"  # Replace with your desired ECS service name
$taskDefinition = "MyTaskFamily:1"  # Replace with your task definition name and revision
$desiredCount = 2  # Number of tasks you want to run
$subnetIds = @("subnet-12345678", "subnet-87654321")  # Replace with your subnet IDs
$securityGroupIds = @("sg-12345678")  # Replace with your security group IDs

# Create ECS Service
New-ECSService -Cluster $clusterName `
               -ServiceName $serviceName `
               -TaskDefinition $taskDefinition `
               -DesiredCount $desiredCount `
               -LaunchType "FARGATE" `
               -NetworkConfiguration @{
                  awsvpcConfiguration = @{
                    subnets = $subnetIds
                    securityGroups = $securityGroupIds
                    assignPublicIp = "ENABLED"
                  }
               } `
               -Region $region

Write-Host "ECS Service '$serviceName' created successfully in cluster '$clusterName'."
