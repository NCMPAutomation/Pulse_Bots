# Define MongoDB connection parameters
$mongoHost = "localhost"
$mongoPort = "27017"
$databaseName = "your_database"

# Command to retrieve collection names
$command = "mongo --host $mongoHost --port $mongoPort --eval 'printjson(db.getSiblingDB(\"$databaseName\").getCollectionNames())'"
$response = Invoke-Expression $command

Write-Host "Collections in Database $databaseName:"
Write-Host $response