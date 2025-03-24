# Parameters
$MongoDBHost = "localhost"        # Replace with MongoDB hostname or IP
$MongoDBPort = "27017"           # Default MongoDB port
$DatabaseName = "testdb"         # Replace with your database name
$Username = "newuser"            # Replace with the username you want to create
$Password = "password123"        # Replace with a secure password
$Role = "readWrite"              # Replace with the desired role (e.g., read, readWrite, dbAdmin)

# Connection to MongoDB using mongo shell
$MongoCommand = @"
use $DatabaseName;
db.createUser({
  user: "$Username",
  pwd: "$Password",
  roles: [
    { role: "$Role", db: "$DatabaseName" }
  ]
});
"@

# Execute the command via Mongo shell
$ShellCommand = mongo --host $MongoDBHost --port $MongoDBPort --eval `$MongoCommand`
Invoke-Expression $ShellCommand
