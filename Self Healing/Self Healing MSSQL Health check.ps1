# Define the server and database names
$serverName = ""
$databaseName = ""
$tableName = "Employees"
# Create the connection string using Windows Authentication
$connectionString = "Server=$serverName;Database=$databaseName;Integrated Security=True;"
 
# Load the SQL Server .NET Data Provider
Add-Type -AssemblyName "System.Data"
 
# Create and open the SQL connection
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString
try {
    $connection.Open()
    Write-Output "Connection to the database was successful."
 
    # Health Check 1: Check Database Size
    $query = "SELECT 
                DB_NAME(database_id) AS DatabaseName,
                (SUM(size) * 8 / 1024) AS SizeMB
              FROM sys.master_files
              WHERE type = 0
              GROUP BY database_id"
    $command = $connection.CreateCommand()
    $command.CommandText = $query
    $reader = $command.ExecuteReader()
    while ($reader.Read()) {
        Write-Output "Database: $($reader["DatabaseName"]), Size: $($reader["SizeMB"]) MB"
    }
    $reader.Close()
 
    ##########################
 
    # Check Server Uptime
    $query = "SELECT sqlserver_start_time FROM sys.dm_os_sys_info"
    $command = $connection.CreateCommand()
    $command.CommandText = $query
    $serverStartTime = $command.ExecuteScalar()
    $uptime = (Get-Date) - $serverStartTime
    Write-Output "Server Uptime: $($uptime.Days) days, $($uptime.Hours) hours, $($uptime.Minutes) minutes"
 
    # Check Threads Connected
    $query = "SELECT COUNT(session_id) AS ThreadsConnected FROM sys.dm_exec_sessions"
    $command.CommandText = $query
    $threadsConnected = $command.ExecuteScalar()
    Write-Output "Threads Connected: $threadsConnected"
 
    # Check Threads Running
    $query = "SELECT COUNT(session_id) AS ThreadsRunning FROM sys.dm_exec_requests WHERE status = 'running'"
    $command.CommandText = $query
    $threadsRunning = $command.ExecuteScalar()
    Write-Output "Threads Running: $threadsRunning"
 
 
} catch {
    Write-Output "An error occurred: $_"
} finally {
    # Close the connection
    $connection.Close()
    Write-Output "Disconnected from the database."
}