# Define PostgreSQL connection parameters
$pgHost = "localhost"
$pgPort = "5432"
$pgDatabase = "your_database"
$pgUser = "your_username"
$pgPassword = "your_password"

# Path to the CSV file and target table
$csvPath = "C:\input.csv"
$tableName = "your_table"

# SQL query to import data
$query = "COPY $tableName FROM '$csvPath' CSV HEADER;"

# Execute the query using psql
$command = "psql -h $pgHost -p $pgPort -U $pgUser -d $pgDatabase -c `"$query`""
Invoke-Expression $command
Write-Host "Data imported from $csvPath into $tableName."