# Define parameters
$serverName = "localhost"
$databaseName = "AutomationDB"
$username = "User1"
$password = "Rocket@89p13"
 
# Create a new SQL Server Management Object
$connectionString = "Server=$serverName;Database=$databaseName;Integrated Security=True;"
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString
 
# Open the connection
$connection.Open()
 
# Create the SQL command to create the user
$sql = @"
CREATE LOGIN [$username] WITH PASSWORD=N'$password', 
     DEFAULT_DATABASE=[$databaseName], 
     CHECK_EXPIRATION=OFF, 
     CHECK_POLICY=OFF;
USE [$databaseName];
CREATE USER [$username] FOR LOGIN [$username];
"@
 
# Execute the SQL command
$command = $connection.CreateCommand()
$command.CommandText = $sql
$command.ExecuteNonQuery()
 
# Close the connection
$connection.Close()
 
Write-Host "User created successfully."