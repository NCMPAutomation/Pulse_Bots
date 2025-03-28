# Define MongoDB connection parameters
$mongoHost = "localhost"
$mongoPort = "27017"

# Command to list databases
$command = "mongo --host $mongoHost --port $mongoPort --eval 'printjson(db.adminCommand({ listDatabases: 1 }))'"
$response = Invoke-Expression $command

Write-Host "Databases:"
Write-Host $response