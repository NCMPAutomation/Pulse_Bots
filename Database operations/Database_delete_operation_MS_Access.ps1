# Ensure the correct bitness of PowerShell is running (32-bit or 64-bit)
# Create a new ADO Connection object
$connection = New-Object -ComObject ADODB.Connection
 
# Path to the Access database
$databasePath = "path to db"
 
# Connection string for the Access database
$connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=$databasePath;"
 
# Open the connection
$connection.Open($connectionString)
 
# SQL query to delete a value from the table
$sqlQuery = "DELETE FROM TestTable1 WHERE ID = 1"
 
# Execute the SQL query
$command = New-Object -ComObject ADODB.Command
$command.ActiveConnection = $connection
$command.CommandText = $sqlQuery
$command.Execute() | Out-Null
 
# Close the connection
$connection.Close()
 
# Release COM objects
[System.Runtime.InteropServices.Marshal]::ReleaseComObject($command) | Out-Null
[System.Runtime.InteropServices.Marshal]::ReleaseComObject($connection) | Out-Null
