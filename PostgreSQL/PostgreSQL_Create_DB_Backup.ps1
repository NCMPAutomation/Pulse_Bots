# Parameters
$PostgreSQLHost = "localhost"        # Replace with your PostgreSQL server hostname or IP
$PostgreSQLPort = "5432"             # Default PostgreSQL port
$AdminUsername = "postgres"          # Replace with an admin username
$AdminPassword = "yourPassword"      # Replace with the admin password
$DatabaseName = "mydatabase"         # Replace with the name of the database to back up
$BackupFilePath = "C:\PostgreSQLBackups\mydatabase_backup.sql" # Replace with the desired backup file path

# Ensure the backup directory exists
$BackupDirectory = Split-Path -Path $BackupFilePath
if (!(Test-Path -Path $BackupDirectory)) {
    New-Item -ItemType Directory -Path $BackupDirectory | Out-Null
}

# Construct the pg_dump command
$PgDumpCommand = @"
pg_dump -h $PostgreSQLHost -p $PostgreSQLPort -U $AdminUsername -d $DatabaseName -F c -f $BackupFilePath
"@

# Execute the pg_dump command
$env:PGPASSWORD = $AdminPassword # Set the password environment variable for authentication
Invoke-Expression $PgDumpCommand

# Confirmation message
Write-Host "Backup of database '$DatabaseName' has been created at '$BackupFilePath'."
