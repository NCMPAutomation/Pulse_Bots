# Parameters
$PostgreSQLHost = "localhost"        # Replace with your PostgreSQL server hostname or IP
$PostgreSQLPort = "5432"             # Default PostgreSQL port
$AdminUsername = "postgres"          # Replace with an admin username
$AdminPassword = "yourPassword"      # Replace with the admin password
$UsernameToDelete = "userToDelete"   # Replace with the username you want to delete

# Create the SQL command to drop a user
$DropUserCommand = @"
DROP USER $UsernameToDelete;
"@

# Construct the psql command
$PsqlCommand = psql -h $PostgreSQLHost -p $PostgreSQLPort -U $AdminUsername -c `$DropUserCommand`

# Execute the psql command
$env:PGPASSWORD = $AdminPassword # Set the password environment variable for authentication
Invoke-Expression $PsqlCommand

# Confirmation message
Write-Host "User '$UsernameToDelete' has been deleted successfully from PostgreSQL."
