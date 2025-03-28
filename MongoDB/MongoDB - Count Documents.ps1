# Define MongoDB connection parameters
$mongoHost = "localhost"
$mongoPort = "27017"
$databaseName = "your_database"
$collectionName = "your_collection"

# Command to count documents in the collection
$command = "mongo --host $mongoHost --port $mongoPort --eval 'db.getSiblingDB(\"$databaseName\").$collectionName.countDocuments()'"
$response = Invoke-Expression $command

Write-Host "Total document count in collection $collectionName : $response"