# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and task definition parameters
$region = "location"  # Replace with your desired AWS region
$taskDefFamily = "MyTaskFamily"  # Replace with your desired task family name
$containerName = "MyAppContainer"  # Replace with your container name
$containerImage = "nginx:latest"  # Replace with your container image
$memory = "512"  # Memory in MiB
$cpu = "256"  # CPU units
$portMappings = @(@{containerPort=80; protocol="tcp"})  # Replace with your port mappings

# Register the ECS Task Definition
Register-ECSTaskDefinition -Family $taskDefFamily `
                           -ContainerDefinitions @(@{
                               Name = $containerName
                               Image = $containerImage
                               Memory = $memory
                               Cpu = $cpu
                               Essential = $true
                               PortMappings = $portMappings
                             }) `
                           -RequiresCompatibilities "FARGATE" `
                           -NetworkMode "awsvpc" `
                           -Cpu $cpu `
                           -Memory $memory `
                           -Region $region

Write-Host "Task definition '$taskDefFamily' registered successfully."
