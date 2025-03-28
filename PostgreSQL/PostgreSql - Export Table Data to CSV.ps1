# Define PostgreSQL connection parameters
$pgHost = "localhost"
$pgPort = "5432"
$pgDatabase = "your_database"
$pgUser = "your_username"
$pgPassword = "your_password"

# Table and export path
$tableName = "your_table"
$exportPath = "C:\output.csv"

# SQL query to export data
$query = "COPY $tableName TO '$exportPath' CSV HEADER;"

# Execute the query using psql
$command = "psql -h $pgHost -p $pgPort -U $pgUser -d $pgDatabase -c `"$query`""
Invoke-Expression $command
Write-Host "Data exported to $exportPath."