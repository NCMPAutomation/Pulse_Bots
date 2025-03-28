# Define PostgreSQL connection parameters
$pgHost = "localhost"
$pgPort = "5432"
$pgDatabase = "your_database"
$pgUser = "your_username"
$pgPassword = "your_password"

# SQL query to create a new table
$query = "CREATE TABLE example_table (id SERIAL PRIMARY KEY, name VARCHAR(50), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);"

# Execute the query using psql
$command = "psql -h $pgHost -p $pgPort -U $pgUser -d $pgDatabase -c `"$query`""
Invoke-Expression $command
Write-Host "Table 'example_table' created successfully."