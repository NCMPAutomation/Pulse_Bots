# Parameters
$PostgreSQLHost = "localhost"        # Replace with your PostgreSQL server hostname or IP
$PostgreSQLPort = "5432"             # Default PostgreSQL port
$AdminUsername = "postgres"          # Replace with an admin username
$AdminPassword = "yourPassword"      # Replace with the admin password
$DatabaseToDelete = "databaseToDelete" # Replace with the name of the database to delete

# Create the SQL command to drop the database
$DropDatabaseCommand = @"
DROP DATABASE $DatabaseToDelete;
"@

# Construct the psql command
$PsqlCommand = psql -h $PostgreSQLHost -p $PostgreSQLPort -U $AdminUsername -c `$DropDatabaseCommand`

# Execute the psql command
$env:PGPASSWORD = $AdminPassword # Set the password environment variable for authentication
Invoke-Expression $PsqlCommand

# Confirmation message
Write-Host "Database '$DatabaseToDelete' has been deleted successfully from PostgreSQL."
