# Parameters
$PostgreSQLHost = "localhost"        # Replace with your PostgreSQL server hostname or IP
$PostgreSQLPort = "5432"             # Default PostgreSQL port
$AdminUsername = "postgres"          # Replace with an admin username
$AdminPassword = "yourPassword"      # Replace with the admin password
$UsernameToModify = "existingUser"   # Replace with the username whose permissions you want to change
$NewRole = "readWrite"               # Replace with the new role to be granted

# Create the SQL command to change user permissions
$ChangePermissionCommand = @"
ALTER ROLE $UsernameToModify WITH $NewRole;
"@

# Construct the psql command
$PsqlCommand = psql -h $PostgreSQLHost -p $PostgreSQLPort -U $AdminUsername -c `$ChangePermissionCommand`

# Execute the psql command
$env:PGPASSWORD = $AdminPassword # Set the password environment variable for authentication
Invoke-Expression $PsqlCommand

# Confirmation message
Write-Host "Permissions for user '$UsernameToModify' have been updated to '$NewRole' successfully in PostgreSQL."
