# Define MySQL connection parameters
$server = "localhost"
$port = ""
$username = ""
$password = ""
$database = "sakila"

# Load MySQL .NET Connector assembly
#Add-Type -Path "C:\Program Files (x86)\MySQL\MySQL Connector NET 9.0\MySql.Data.dll"
[System.Reflection.Assembly]::LoadFrom("C:\Program Files (x86)\MySQL\MySQL Connector NET 9.0\MySql.Data.dll")

# Function to check MySQL connection
function Test-MySQLConnection {
    param (
        [string]$server,
        [string]$port,
        [string]$username,
        [string]$password
    )
    try {
        $connectionString = "server=$server;port=$port;user id=$username;password=$password;"
        $connection = New-Object MySql.Data.MySqlClient.MySqlConnection
        $connection.ConnectionString = $connectionString
        $connection.Open()
        Write-Output "Connection to MySQL server successful."
        $connection.Close()
    } catch {
        Write-Output "Failed to connect to MySQL server: $_"
    }
}


function Get-MySQLHealthCheck {
    param (
        [string]$server,
        [string]$port,
        [string]$username,
        [string]$password
    )
    try {
        $connectionString = "server=$server;port=$port;user id=$username;password=$password;"
        $connection = New-Object MySql.Data.MySqlClient.MySqlConnection
        $connection.ConnectionString = $connectionString
        $connection.Open()
        
        # Function to execute query and return the value
        function Get-StatusValue($query) {
            $command = $connection.CreateCommand()
            $command.CommandText = $query
            $reader = $command.ExecuteReader()
            $value = $null
            if ($reader.Read()) {
                $value = $reader.GetString(1)
            }
            $reader.Close()
            return $value
        }
        
        # Check server uptime
        $uptime = Get-StatusValue "SHOW GLOBAL STATUS LIKE 'Uptime';"
        Write-Output "Server Uptime: $uptime seconds"
        
        # Check threads connected
        $threadsConnected = Get-StatusValue "SHOW GLOBAL STATUS LIKE 'Threads_connected';"
        Write-Output "Threads Connected: $threadsConnected"
        
        # Check threads running
        $threadsRunning = Get-StatusValue "SHOW GLOBAL STATUS LIKE 'Threads_running';"
        Write-Output "Threads Running: $threadsRunning"
        
        # Check questions
        $questions = Get-StatusValue "SHOW GLOBAL STATUS LIKE 'Questions';"
        Write-Output "Questions: $questions"
        
        $connection.Close()
    } catch {
        Write-Output "Failed to perform health check: $_"
    }
}

# Function to check database status
function Check-DatabaseStatus {
    param (
        [string]$server,
        [string]$port,
        [string]$username,
        [string]$password,
        [string]$database
    )
    try {
        $connectionString = "server=$server;port=$port;user id=$username;password=$password;database=$database;"
        $connection = New-Object MySql.Data.MySqlClient.MySqlConnection
        $connection.ConnectionString = $connectionString
        $connection.Open()
        Write-Output "Connection to database '$database' successful."
        $connection.Close()
    } catch {
        Write-Output "Failed to connect to database '$database': $_"
    }
}

# Perform health checks
Test-MySQLConnection -server $server -port $port -username $username -password $password
Get-MySQLServerStatus -server $server -port $port -username $username -password $password
Check-DatabaseStatus -server $server -port $port -username $username -password $password -database $database
Get-MySQLHealthCheck -server $server -port $port -username $username -password $password


