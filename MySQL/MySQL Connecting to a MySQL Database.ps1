# Import MySQL .NET Connector
Add-Type -Path "C:\Program Files\MySQL\MySQL Connector Net 8.0\MySql.Data.dll"

# Create a connection string
$ConnectionString = "server=localhost;user id=root;password=YourPassword;database=YourDatabase"

# Open the connection
$Connection = New-Object MySql.Data.MySqlClient.MySqlConnection($ConnectionString)
$Connection.Open()

Write-Host "Connected to MySQL database"
$Connection.Close()