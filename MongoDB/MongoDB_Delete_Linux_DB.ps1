# Parameters
$MongoDBHost = "localhost"        # Replace with your MongoDB server hostname or IP
$MongoDBPort = "27017"           # Default MongoDB port
$DatabaseName = "databaseToDelete"  # Replace with the name of the database to delete

# MongoDB command to delete the database
$MongoCommand = @"
use $DatabaseName;
db.dropDatabase();
"@

# Execute the command via Mongo shell
$ShellCommand = mongo --host $MongoDBHost --port $MongoDBPort --eval `$MongoCommand`
Invoke-Expression $ShellCommand

# Confirm the deletion (Optional)
Write-Host "Database '$DatabaseName' has been deleted successfully."
