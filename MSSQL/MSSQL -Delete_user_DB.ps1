#delete user in MSSQL
# Define parameters

$serverName = "localhost"

$databaseName = "AutomationDB"

$username = "User1"
 
# Create a new SQL Server Management Object

$connectionString = "Server=$serverName;Database=$databaseName;Integrated Security=True;"

$connection = New-Object System.Data.SqlClient.SqlConnection

$connection.ConnectionString = $connectionString
 
# Open the connection

$connection.Open()
 
# Create the SQL command to delete the user

$sql = @"

USE [$databaseName];

DROP USER [$username];

DROP LOGIN [$username];

"@
 
# Execute the SQL command

$command = $connection.CreateCommand()

$command.CommandText = $sql

$command.ExecuteNonQuery()
 
# Close the connection

$connection.Close()
 
Write-Host "User deleted successfully."

 