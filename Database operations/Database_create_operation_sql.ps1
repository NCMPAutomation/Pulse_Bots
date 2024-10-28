[void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
# Define MySQL connection details
$server = "localhost"  # Replace with your MySQL server address
$username = "root"     # Replace with your MySQL username
$password = "root" # Replace with your MySQL password
$database = "test_automation" # Name of the new schema

# Create a new schema
$createSchemaQuery = "CREATE SCHEMA IF NOT EXISTS $database;"

# Create a new table within the schema
$createTableQuery = @"
CREATE TABLE IF NOT EXISTS $database.test_table (
    id VARCHAR(255),
    name VARCHAR(255),
    place VARCHAR(255)
);
"@

# Function to execute MySQL query
function Execute-MySQLQuery {
    param (
        [string]$query
    )
    $connectionString = "server=$server;user id=$username;password=$password;database=mysql"
    $connection = New-Object MySql.Data.MySqlClient.MySqlConnection
    $connection.ConnectionString = $connectionString
    $connection.Open()
    $command = $connection.CreateCommand()
    $command.CommandText = $query
    $command.ExecuteNonQuery()
    $connection.Close()
}

# Execute the queries
Execute-MySQLQuery -query $createSchemaQuery
Execute-MySQLQuery -query $createTableQuery

Write-Output "Schema and table created successfully."
