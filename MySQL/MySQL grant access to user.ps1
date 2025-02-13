# Load MySQL .NET Connector
[void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")

# Define connection parameters
$server = "localhost"
$username = "your_username"
$password = "your_password"
$newUser = "new_username"

# Create connection string
$connStr = "server=$server;user id=$username;password=$password;"

# Create MySQL connection object
$conn = New-Object MySql.Data.MySqlClient.MySqlConnection($connStr)

# Open connection
$conn.Open()

# Create MySQL command object
$cmd = New-Object MySql.Data.MySqlClient.MySqlCommand
$cmd.Connection = $conn

# Check if user exists
$cmd.CommandText = "SELECT User, Host FROM mysql.user WHERE User = '$newUser';"
$reader = $cmd.ExecuteReader()

if ($reader.HasRows) {
    Write-Output "User '$newUser' exists in the database."
} else {
    Write-Output "User '$newUser' does not exist in the database."
}

# Close connection
$conn.Close()