# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and RDS parameters
$region = "us-east-1"  # Replace with your desired AWS region
$dbInstanceIdentifier = "my-database-instance"  # Replace with your RDS instance identifier
$newAllocatedStorage = 100  # Replace with the desired storage size in GB

# Modify the RDS instance storage size
Edit-RDSDBInstance -DBInstanceIdentifier $dbInstanceIdentifier `
                   -AllocatedStorage $newAllocatedStorage `
                   -Region $region

Write-Host "RDS instance '$dbInstanceIdentifier' storage resized to $newAllocatedStorage GB in region '$region'."
