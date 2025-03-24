# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and source database parameters
$region = "us-east-1"  # Replace with your desired AWS region
$sourceDBInstanceIdentifier = "my-postgresql-db"  # Replace with your source DB instance identifier
$readReplicaIdentifier = "my-postgresql-replica"  # Replace with your desired read replica identifier

# Create a read replica
New-RDSDBInstanceReadReplica -SourceDBInstanceIdentifier $sourceDBInstanceIdentifier `
                             -DBInstanceIdentifier $readReplicaIdentifier `
                             -Region $region

Write-Host "Read replica '$readReplicaIdentifier' created successfully for source database '$sourceDBInstanceIdentifier' in region '$region'."
