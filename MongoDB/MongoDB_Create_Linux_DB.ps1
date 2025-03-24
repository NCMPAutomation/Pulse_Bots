# Parameters
$MongoDBHost = "localhost"        # Replace with your MongoDB server hostname or IP
$MongoDBPort = "27017"           # Default MongoDB port
$DatabaseName = "newdatabase"    # Replace with the name of the database to create

# MongoDB command to create the database
$MongoCommand = @"
use $DatabaseName;
db.testCollection.insert({ testField: "testValue" });
"@

# Execute the command via Mongo shell
$ShellCommand = "mongo --host $MongoDBHost --port $MongoDBPort --eval `$MongoCommand`"
Invoke-Expression $ShellCommand

# Confirm the database creation (Optional)
Write-Host "Database '$DatabaseName' has been created and initialized with a test collection."
