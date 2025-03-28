# Define PostgreSQL connection parameters
$pgHost = "localhost"
$pgPort = "5432"
$pgDatabase = "postgres"
$pgUser = "your_username"
$pgPassword = "your_password"

# Test the connection using psql
$command = "psql -h $pgHost -p $pgPort -U $pgUser -d $pgDatabase -c `"SELECT version();`""
$response = Invoke-Expression $command

# Check the response
if ($response) {
    Write-Host "Connection successful!"
} else {
    Write-Host "Connection failed."
}