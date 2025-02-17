#Change user permission
# Define parameters

$serverName = "localhost"

$databaseName = "AutomationDB"

$username = "User1"

$newPermission = "SELECT"
 
# Create a new SQL Server Management Object

$connectionString = "Server=$serverName;Database=$databaseName;Integrated Security=True;"

$connection = New-Object System.Data.SqlClient.SqlConnection

$connection.ConnectionString = $connectionString
 
# Open the connection

$connection.Open()
 
# Create the SQL command to change user permissions

$sql = @"

GRANT $newPermission TO [$username];

"@
 
# Execute the SQL command

$command = $connection.CreateCommand()

$command.CommandText = $sql

$command.ExecuteNonQuery()
 
# Close the connection

$connection.Close()
 
Write-Host "User permissions changed successfully."

 