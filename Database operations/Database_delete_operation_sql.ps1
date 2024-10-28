###################################3
$mysql_server = ""
$mysql_user = ""
$mysql_password = ""
$dbName = ""
 
[void][system.reflection.Assembly]::LoadFrom("C:\Program Files (x86)\MySQL\MySQL Installer for Windows\MySql.Data.dll")
 
$Connection = New-Object -TypeName MySql.Data.MySqlClient.MySqlConnection
$Connection.ConnectionString = "SERVER=$mysql_server;DATABASE=$dbName;UID=$mysql_user;PWD=$mysql_password"
 
$Connection.Open()
 
$sql = New-Object MySql.Data.MySqlClient.MySqlCommand
$sql.Connection = $Connection
 
$sql.CommandText = "DELETE FROM test_table WHERE PLace='value'"
$sql.ExecuteNonQuery()
 
$Connection.Close()
