# Define PostgreSQL connection parameters
$pgHost = "localhost"
$pgPort = "5432"
$pgDatabase = "postgres"
$pgUser = "your_username"
$pgPassword = "your_password"

# Command to list databases
$query = "SELECT datname FROM pg_database WHERE datistemplate = false;"

# Execute the command using psql
$command = "psql -h $pgHost -p $pgPort -U $pgUser -d $pgDatabase -c `"$query`""
Invoke-Expression $command