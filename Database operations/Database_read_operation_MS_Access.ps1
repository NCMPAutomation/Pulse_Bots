# Define the path to the Access database
$databasePath = "path to DB.accdb"

# Create a connection string
$connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=$databasePath"

# Connect to the database
$connection = New-Object -ComObject ADODB.Connection
$connection.Open($connectionString)

# Define the query to read data
$query = "SELECT * FROM TestTable1"

# Execute the query
$recordset = New-Object -ComObject ADODB.Recordset
$recordset.Open($query, $connection)

# Read and display the data
while (!$recordset.EOF) {
    $id = $recordset.Fields.Item("ID").Value
    $name = $recordset.Fields.Item("Name").Value
    $age = $recordset.Fields.Item("Age").Value
    Write-Output "ID: $id, Name: $name, Age: $age"
    $recordset.MoveNext()
}

# Close the recordset and connection
$recordset.Close()
$connection.Close()
