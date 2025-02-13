# Load MySQL .NET Connector
[void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")

# Define connection parameters
$server = "localhost"
$username = "your_username"
$password = "your_password"
$newUser = "new_username"
$newUserPassword = "new_user_password"
$dbname = "your_database"

# Create connection string
$connStr = "server=$server;user id=$username;password=$password;"

# Create MySQL connection object
$conn = New-Object MySql.Data.MySqlClient.MySqlConnection($connStr)

# Open connection
$conn.Open()

# Create MySQL command object
$cmd = New-Object MySql.Data.MySqlClient.MySqlCommand
$cmd.Connection = $conn

# Create new user
$cmd.CommandText = "CREATE USER '$newUser'@'localhost' IDENTIFIED BY '$newUserPassword';"
$cmd.ExecuteNonQuery()

# Grant privileges to the new user
$cmd.CommandText = "GRANT ALL PRIVILEGES ON $dbname.* TO '$newUser'@'localhost';"
$cmd.ExecuteNonQuery()

# Flush privileges to ensure changes take effect
$cmd.CommandText = "FLUSH PRIVILEGES;"
$cmd.ExecuteNonQuery()

# Close connection
$conn.Close()

Write-Output "User '$newUser' created successfully with access to database '$dbname'."