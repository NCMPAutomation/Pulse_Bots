# Define PostgreSQL connection parameters
$pgHost = "localhost"
$pgPort = "5432"
$pgDatabase = "your_database"
$pgUser = "your_username"
$pgPassword = "your_password"

# Define SQL query
$query = "SELECT * FROM your_table LIMIT 5;"

# Execute the query using psql
$command = "psql -h $pgHost -p $pgPort -U $pgUser -d $pgDatabase -c `"$query`""
Invoke-Expression $command