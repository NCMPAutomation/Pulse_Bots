# Establish a connection to the database
$ConnectionString = "Server=YourServerName;Database=YourDatabaseName;User Id=YourUsername;Password=YourPassword;"
$Connection = New-Object System.Data.SqlClient.SqlConnection
$Connection.ConnectionString = $ConnectionString
$Connection.Open()
Write-Output "Connected to Database"
$Connection.Close()