# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and RDS parameters
$region = "us-east-1"  # Replace with your desired AWS region
$dbInstanceIdentifier = "my-postgresql-db"  # Replace with your desired DB instance identifier
$dbInstanceClass = "db.t3.micro"  # Replace with your desired instance class
$engine = "postgres"  # Specify PostgreSQL as the database engine
$allocatedStorage = 20  # Storage size in GB
$masterUsername = "admin"  # Master username
$masterUserPassword = "YourSecurePassword123!"  # Master password
$dbName = "MyPostgresDatabase"  # Replace with your database name

# Create the PostgreSQL RDS instance
New-RDSDBInstance -DBInstanceIdentifier $dbInstanceIdentifier `
                  -DBInstanceClass $dbInstanceClass `
                  -Engine $engine `
                  -AllocatedStorage $allocatedStorage `
                  -MasterUsername $masterUsername `
                  -MasterUserPassword $masterUserPassword `
                  -DBName $dbName `
                  -Region $region

Write-Host "PostgreSQL database instance '$dbInstanceIdentifier' created successfully in region '$region'."
