# Define MongoDB connection parameters
$mongoHost = "localhost"
$mongoPort = "27017"
$databaseName = "your_database"
$collectionName = "your_collection"

# Query to find documents to delete
$query = "{ age: { $lt : 18 } }"

# Command to delete documents
$command = "mongo --host $mongoHost --port $mongoPort --eval 'db.getSiblingDB(\"$databaseName\").$collectionName.deleteMany($query)'"
Invoke-Expression $command

Write-Host "Documents matching the query have been deleted."