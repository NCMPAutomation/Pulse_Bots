# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and ALB parameters
$region = "us-east-1"  # Replace with your desired AWS region
$vpcId = "vpc-12345678"  # Replace with your VPC ID
$subnetIds = @("subnet-12345678", "subnet-87654321")  # Replace with your subnet IDs
$securityGroupIds = @("sg-12345678")  # Replace with your security group IDs
$loadBalancerName = "MyApplicationLoadBalancer"  # Replace with your desired load balancer name

# Create the Application Load Balancer
$alb = New-ELBLoadBalancer -Name $loadBalancerName `
                           -Type "application" `
                           -Subnets $subnetIds `
                           -SecurityGroups $securityGroupIds `
                           -Scheme "internet-facing" `
                           -IpAddressType "ipv4" `
                           -Region $region

Write-Host "Application Load Balancer '$($alb.LoadBalancerArn)' created successfully in region '$region'."
