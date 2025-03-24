# Parameters
$MongoDBHost = "localhost"        # Replace with MongoDB hostname or IP
$MongoDBPort = "27017"           # Default MongoDB port
$DatabaseName = "testdb"         # Replace with the database where the user exists
$Username = "userToDelete"       # Replace with the username you want to delete

# MongoDB command to delete the user
$MongoCommand = @"
use $DatabaseName;
db.dropUser("$Username");
"@

# Execute the command via Mongo shell
$ShellCommand = mongo --host $MongoDBHost --port $MongoDBPort --eval `$MongoCommand`
Invoke-Expression $ShellCommand
