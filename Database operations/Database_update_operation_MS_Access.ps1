# Ensure the correct bitness of PowerShell is running (32-bit or 64-bit)
# Create a new ADO Connection object
$connection = New-Object -ComObject ADODB.Connection
 
# Path to the Access database
$databasePath = "path to the DB.accdb"
 
# Connection string for the Access database
$connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=$databasePath;"
 
# Open the connection
$connection.Open($connectionString)
 
# SQL query to update fields in the table
$sqlQuery = "UPDATE TestTable1 SET Age = 20 WHERE ID = 2"
 
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
 
Write-Output "Field updated successfully in the database at $databasePath"
