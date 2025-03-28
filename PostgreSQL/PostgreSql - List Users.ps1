# Define PostgreSQL connection parameters
$pgHost = "localhost"
$pgPort = "5432"
$pgDatabase = "postgres"
$pgUser = "your_username"
$pgPassword = "your_password"

# SQL query to list users
$query = "SELECT usename FROM pg_user;"

# Execute the query using psql
$command = "psql -h $pgHost -p $pgPort -U $pgUser -d $pgDatabase -c `"$query`""
Invoke-Expression $command