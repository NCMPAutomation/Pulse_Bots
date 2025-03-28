# Check the connection to the database before email insertion
try {
    $Connection.Open()
    Write-Output "Database Connection Verified"
    $Connection.Close()
} catch {
    Write-Error "Database Connection Error: $_"
}