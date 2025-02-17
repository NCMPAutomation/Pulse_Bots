#Check user permission
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
 
# Create the SQL command to check user permissions

$sql = @"

SELECT permission_name, state_desc 

FROM sys.database_permissions 

WHERE grantee_principal_id = USER_ID(N'$username');

"@
 
# Execute the SQL command

$command = $connection.CreateCommand()

$command.CommandText = $sql

$reader = $command.ExecuteReader()
 
# Display the results

while ($reader.Read()) {

    Write-Host "$($reader["permission_name"]) - $($reader["state_desc"])"

}
 
# Close the connection

$reader.Close()

$connection.Close()

 