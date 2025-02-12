##Access Health Check
# Define the connection string
$connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source='C:\Users\Netcon\Documents\test_db.accdb';"
$connection = New-Object -ComObject ADODB.Connection
 
try {
    # Connect to the database
    $connection.Open($connectionString)
    Write-Output "Connection to the database was successful."
 
    # Health Check 1: Check Table Existence
    $tableName = "test_table"
    $query = "SELECT * FROM $tableName"
    $recordset = New-Object -ComObject ADODB.Recordset
    try {
        $recordset.Open($query, $connection)
        Write-Output "Table $tableName exists."
    } catch {
        Write-Output "Table $tableName does not exist: $_"
    } finally {
        $recordset.Close()
    }
 
    # Health Check 2: Check Table Row Count
    $query = "SELECT COUNT(*) AS RowCount FROM $tableName"
    $recordset.Open($query, $connection)
    $rowCount = $recordset.Fields.Item("RowCount").Value
    Write-Output "Table $tableName contains $rowCount rows."
    $recordset.Close()
 
    # Health Check 3: Check for Null Values in Critical Columns
    $criticalColumn = "Place"
    $query = "SELECT COUNT(*) AS NullCount FROM $tableName WHERE $criticalColumn IS NULL"
    $recordset.Open($query, $connection)
    $nullCount = $recordset.Fields.Item("NullCount").Value
    Write-Output "Column $criticalColumn in table $tableName contains $nullCount null values."
    $recordset.Close()
 
    # Health Check 4: Check Database Size
    $databasePath = 'C:\Users\Netcon\Documents\test_db.accdb'
    $fileInfo = Get-Item $databasePath
    $fileSizeMB = [math]::Round($fileInfo.Length / 1MB, 2)
    Write-Output "The size of the database is $fileSizeMB MB."
 
} catch {
    Write-Output "An error occurred: $_"
} finally {
    # Disconnect from the database
    $connection.Close()
    Write-Output "Disconnected from the database."
}