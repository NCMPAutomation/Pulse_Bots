# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region
$region = "us-east-1"  # Replace with your desired AWS region

# Get all EC2 instances
$instances = Get-EC2Instance -Region $region

# Loop through instances to identify failed or stopped instances
foreach ($reservation in $instances.Reservations) {
    foreach ($instance in $reservation.Instances) {
        $instanceId = $instance.InstanceId
        $state = $instance.State.Name

        # Check if the instance is in a failed or stopped state
        if ($state -eq "stopped" -or $state -eq "stopping") {
            Write-Host "Instance ID '$instanceId' is in state '$state'. Attempting to reboot..."
            
            # Reboot the instance
            Start-EC2Instance -InstanceId $instanceId -Region $region
            Write-Host "Instance ID '$instanceId' has been restarted."
        } else {
            Write-Host "Instance ID '$instanceId' is in state '$state'. No action required."
        }
    }
}
