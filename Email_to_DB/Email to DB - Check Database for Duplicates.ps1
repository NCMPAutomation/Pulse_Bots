# Verify if the email has already been inserted into the database
$CheckQuery = "SELECT COUNT(*) FROM EmailTable WHERE Subject = '$($Email.Subject)' AND Sender = '$($Email.SenderName)'"
$Command.CommandText = $CheckQuery
$Result = $Command.ExecuteScalar()
if ($Result -gt 0) {
    Write-Output "Duplicate email found: $($Email.Subject)"
}