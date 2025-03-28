# Define MongoDB connection parameters
$mongoHost = "localhost"
$mongoPort = "27017"
$databaseName = "your_database"
$collectionName = "your_collection"

# Query to execute
$query = "{ age: { $gte: 30 } }"

# Command to query documents
$command = "mongo --host $mongoHost --port $mongoPort --eval 'printjson(db.getSiblingDB(\"$databaseName\").$collectionName.find($query).toArray())'"
$response = Invoke-Expression $command

Write-Host "Query Results:"
Write-Host $response