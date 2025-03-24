# Parameters
$MongoDBHost = "localhost"        # Replace with your MongoDB server hostname or IP
$MongoDBPort = "27017"           # Default MongoDB port
$DatabaseName = "restoredDatabase" # Replace with the name of the database to restore
$BackupPath = "/path/to/backup"  # Replace with the path to the backup directory on the Linux machine

# MongoDB command to restore the database
$MongoRestoreCommand = @"
mongorestore --host $MongoDBHost --port $MongoDBPort --db $DatabaseName $BackupPath/$DatabaseName
"@

# Execute the restore command
Invoke-Expression $MongoRestoreCommand

# Confirmation message
Write-Host "Backup from '$BackupPath' has been restored to database '$DatabaseName'."
