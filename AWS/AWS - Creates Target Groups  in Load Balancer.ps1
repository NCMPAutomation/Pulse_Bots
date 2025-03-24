# Set AWS Region
$Region = "Location" #example us-east-1

# Define parameters for the target group
$TargetGroupName = "my-target-group"
$Protocol = "HTTP"                 # Options: HTTP, HTTPS
$Port = 80                         # Replace with your desired port
$VpcId = "VPC Id"                  # Replace with your VPC ID example vpc-0123456789abcdef0
$HealthCheckProtocol = "HTTP"      # Health check protocol
$HealthCheckPath = "/"             # Health check path

# Create the target group
New-ELB2TargetGroup `
    -Region $Region `
    -Name $TargetGroupName `
    -Protocol $Protocol `
    -Port $Port `
    -VpcId $VpcId `
    -HealthCheckProtocol $HealthCheckProtocol `
    -HealthCheckPath $HealthCheckPath