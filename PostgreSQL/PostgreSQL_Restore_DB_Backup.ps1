# Parameters
$PostgreSQLHost = "localhost"        # Replace with your PostgreSQL server hostname or IP
$PostgreSQLPort = "5432"             # Default PostgreSQL port
$AdminUsername = "postgres"          # Replace with an admin username
$AdminPassword = "yourPassword"      # Replace with the admin password
$DatabaseName = "restoredDatabase"   # Replace with the target database name
$BackupFilePath = "C:\PostgreSQLBackups\mydatabase_backup.sql" # Replace with the path to your backup file

# Ensure the target database exists (optional step)
$CreateDatabaseCommand = @"
CREATE DATABASE $DatabaseName;
"@
$CreateDbCommand = psql -h $PostgreSQLHost -p $PostgreSQLPort -U $AdminUsername -c `$CreateDatabaseCommand`
$env:PGPASSWORD = $AdminPassword
Invoke-Expression $CreateDbCommand

# Restore the database from the backup file
$RestoreCommand = @"
psql -h $PostgreSQLHost -p $PostgreSQLPort -U $AdminUsername -d $DatabaseName -f $BackupFilePath
"@
Invoke-Expression $RestoreCommand

# Confirmation message
Write-Host "Database has been restored from backup file '$BackupFilePath' to '$DatabaseName'."
