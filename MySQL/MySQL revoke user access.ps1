# Load MySQL .NET Connector
[void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")

# Define connection parameters
$server = "localhost"
$username = "your_username"
$password = "your_password"
$targetUser = "target_username"
$dbname = "your_database"

# Create connection string
$connStr = "server=$server;user id=$username;password=$password;"

# Create MySQL connection object
$conn = New-Object MySql.Data.MySqlClient.MySqlConnection($connStr)

# Open connection
$conn.Open()