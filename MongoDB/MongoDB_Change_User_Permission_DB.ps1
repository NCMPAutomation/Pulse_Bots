# Parameters
$MongoDBHost = "localhost"        # Replace with your MongoDB server hostname or IP
$MongoDBPort = "27017"           # Default MongoDB port
$DatabaseName = "targetDatabase" # Replace with the database name
$Username = "existingUser"       # Replace with the username you want to modify
$NewRole = "readWrite"           # Replace with the new role you want to assign

# MongoDB command to update user permissions
$MongoCommand = @"
use $DatabaseName;
db.updateUser("$Username", {
  roles: [
    { role: "$NewRole", db: "$DatabaseName" }
  ]
});
"@

# Execute the command via Mongo shell
$ShellCommand = mongo --host $MongoDBHost --port $MongoDBPort --eval `$MongoCommand`
Invoke-Expression $ShellCommand

# Confirmation message
Write-Host "Permissions for user '$Username' have been updated in database '$DatabaseName'."
