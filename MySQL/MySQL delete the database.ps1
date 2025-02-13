# Load MySQL .NET Connector
[void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")

# Define connection parameters
$server = "localhost"
$username = "your_username"
$password = "your_password"
$dbname = "database_to_delete"

# Create connection string
$connStr = "server=$server;user id=$username;password=$password;"

# Create MySQL connection object
$conn = New-Object MySql.Data.MySqlClient.MySqlConnection($connStr)

# Open connection
$conn.Open()

# Create MySQL command object
$cmd = New-Object MySql.Data.MySqlClient.MySqlCommand
$cmd.Connection = $conn

# Delete the database
$cmd.CommandText = "DROP DATABASE $dbname;"
$cmd.ExecuteNonQuery()

# Close connection
$conn.Close()

Write-Output "Database '$dbname' has been deleted successfully."