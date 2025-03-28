# Define PostgreSQL connection parameters
$pgHost = "localhost"
$pgPort = "5432"
$pgDatabase = "your_database"
$pgUser = "your_username"
$pgPassword = "your_password"

# SQL query to delete a table
$tableName = "example_table"
$query = "DROP TABLE IF EXISTS $tableName;"

# Execute the query using psql
$command = "psql -h $pgHost -p $pgPort -U $pgUser -d $pgDatabase -c `"$query`""
Invoke-Expression $command
Write-Host "Table '$tableName' deleted successfully."