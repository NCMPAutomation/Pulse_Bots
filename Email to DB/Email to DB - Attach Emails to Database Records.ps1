# Add email subject and body to a database record
$Query = "INSERT INTO EmailDetails (Subject, Body) VALUES ('$($Email.Subject)', '$($Email.Body)')"
$Command.CommandText = $Query
$Command.ExecuteNonQuery()
Write-Output "Email content added to database"