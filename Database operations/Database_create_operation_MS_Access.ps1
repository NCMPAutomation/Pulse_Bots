# Define the path for the new Access database
$databasePath = "path to DB"

# Create a new Access database
$connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=$databasePath"
$catalog = New-Object -ComObject ADOX.Catalog
$catalog.Create($connectionString)

# Connect to the new database
$connection = New-Object -ComObject ADODB.Connection
$connection.Open($connectionString)

# Create a new table
$tableName = "TestTable1"
$createTableQuery = @"
CREATE TABLE $tableName (
    ID AUTOINCREMENT PRIMARY KEY,
    Name TEXT(50),
    Age INT
)
"@
$connection.Execute($createTableQuery)

# Insert test data into the table
$insertDataQuery = @"
INSERT INTO $tableName (Name, Age) VALUES ('John Doe', 30);

"@

$connection.Execute($insertDataQuery)

# Close the connection
$connection.Close()

Write-Output "Database created and populated with test data successfully."
