[void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
# Define MySQL connection details
$server = "localhost"  # Replace with your MySQL server address
$username = "root"     # Replace with your MySQL username
$password = "root" # Replace with your MySQL password
$database = "test_automation" # Name of the new schema

$TableQuery = @"
SELECT * FROM test_automation.test_table WHERE name = 'AAA';
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
    $reader = $command.ExecuteReader()
    while ($reader.Read()) {
    for ($i = 0; $i -lt $reader.FieldCount; $i++) {
        Write-Output $reader.GetValue($i)
    }
}
$reader.Close()

    $connection.Close()
}


Execute-MySQLQuery -query $TableQuery
