# Parameters
$MongoDBHost = "localhost"        # Replace with your MongoDB server hostname or IP
$MongoDBPort = "27017"           # Default MongoDB port
$DatabaseName = "mydatabase"     # Replace with the name of the database to back up
$BackupPath = "C:\MongoDBBackups" # Replace with your desired backup directory

# Ensure backup directory exists
if (!(Test-Path -Path $BackupPath)) {
    New-Item -ItemType Directory -Path $BackupPath | Out-Null
}

# Construct the mongodump command
$MongoDumpCommand = @"
mongodump --host $MongoDBHost --port $MongoDBPort --db $DatabaseName --out $BackupPath
"@

# Execute the command
Invoke-Expression $MongoDumpCommand

# Confirmation message
Write-Host "Backup of database '$DatabaseName' has been created at '$BackupPath'."
