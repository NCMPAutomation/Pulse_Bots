# Parameters
$PostgreSQLHost = "localhost"        # Replace with your PostgreSQL server hostname or IP
$PostgreSQLPort = "5432"             # Default PostgreSQL port
$AdminUsername = "postgres"          # Replace with an admin username
$AdminPassword = "yourPassword"      # Replace with the admin password
$NewUsername = "newuser"             # Replace with the username you want to create
$NewPassword = "password123"         # Replace with the password for the new user

# Create the SQL command to create a user
$CreateUserCommand = @"
CREATE USER $NewUsername WITH PASSWORD '$NewPassword';
"@

# Construct the psql command
$PsqlCommand = psql -h $PostgreSQLHost -p $PostgreSQLPort -U $AdminUsername -c `$CreateUserCommand`

# Execute the psql command
$env:PGPASSWORD = $AdminPassword # Set the password environment variable for authentication
Invoke-Expression $PsqlCommand

# Confirmation message
Write-Host "User '$NewUsername' has been created successfully in PostgreSQL."
