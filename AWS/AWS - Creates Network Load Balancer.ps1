# Set AWS Region
$Region = "Location" #example us-east-1

# Define parameters for the NLB
$LoadBalancerName = "MyNetworkLoadBalancer"
$VpcId = "VPC ID"                         # Replace with your VPC ID example
$SubnetIds = @("subnet1", "subnet2")      # Replace with your Subnet IDs subnet-0123456789abcde1 and subnet-0123456789abcde2
$Scheme = "internet-facing"               # Options: "internet-facing" or "internal"

# Create the Load Balancer
$LoadBalancer = New-ELB2LoadBalancer `
    -Region $Region `
    -Name $LoadBalancerName `
    -Type "network" `
    -SubnetMapping_Subnets $SubnetIds `
    -Scheme $Scheme

# Output Load Balancer details
Write-Output "Network Load Balancer created with ARN: $($LoadBalancer.LoadBalancerArn)"
