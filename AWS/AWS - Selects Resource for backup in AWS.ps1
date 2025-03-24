# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region
$region = "us-east-1"  # Replace with your desired AWS region

# Retrieve a list of EC2 instances
$instances = Get-EC2Instance -Region $region

# Display the instances
Write-Host "Available EC2 Instances:"
foreach ($instance in $instances.Reservations.Instances) {
    Write-Host "Instance ID: $($instance.InstanceId) | State: $($instance.State.Name) | Name: $(($instance.Tags | Where-Object { $_.Key -eq 'Name' }).Value)"
}

# Prompt the user to select an instance for backup
$selectedInstanceId = Read-Host "Enter the Instance ID of the resource you want to back up"

# Confirm the selection
Write-Host "You have selected Instance ID: $selectedInstanceId for backup."

# (Optional) Placeholder for backup logic
Write-Host "Triggering backup for Instance ID: $selectedInstanceId..."
# Add your backup logic here, such as creating a snapshot or using AWS Backup.
