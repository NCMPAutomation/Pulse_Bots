# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region and RDS parameters
$region = "us-east-1"  # Replace with your desired AWS region
$dbInstanceIdentifier = "my-maria-db"  # Replace with your desired DB instance identifier
$dbInstanceClass = "db.t3.micro"  # Replace with your desired instance class
$engine = "mariadb"  # Specify MariaDB as the database engine
$allocatedStorage = 20  # Storage size in GB
$masterUsername = "admin"  # Master username
$masterUserPassword = "YourSecurePassword123!"  # Master password
$dbName = "MyMariaDatabase"  # Replace with your database name

# Create the MariaDB RDS instance
New-RDSDBInstance -DBInstanceIdentifier $dbInstanceIdentifier `
                  -DBInstanceClass $dbInstanceClass `
                  -Engine $engine `
                  -AllocatedStorage $allocatedStorage `
                  -MasterUsername $masterUsername `
                  -MasterUserPassword $masterUserPassword `
                  -DBName $dbName `
                  -Region $region

Write-Host "MariaDB database instance '$dbInstanceIdentifier' created successfully in region '$region'."
