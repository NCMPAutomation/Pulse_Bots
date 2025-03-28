# Insert email subject and sender into a database table
$Query = "INSERT INTO EmailTable (Subject, Sender) VALUES ('$($Email.Subject)', '$($Email.SenderName)')"
$Command = New-Object System.Data.SqlClient.SqlCommand
$Command.Connection = $Connection
$Command.CommandText = $Query
$Command.ExecuteNonQuery()
Write-Output "Data Inserted"