# Define PostgreSQL connection parameters
$pgHost = "localhost"
$pgPort = "5432"
$pgDatabase = "your_database"
$tableName = "example_table"
$backupPath = "C:\$tableName.sql"

# Command to back up the table
$command = "pg_dump -h $pgHost -p $pgPort -U postgres -t $tableName -f `"$backupPath`" $pgDatabase"
Invoke-Expression $command
Write-Host "Backup of table '$tableName' created at $backupPath."