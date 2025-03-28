# Define MongoDB connection parameters
$mongoHost = "localhost"
$mongoPort = "27017"
$databaseName = "your_database"
$collectionName = "your_collection"

# Query to find documents to update
$query = "{ name: \"John Doe\" }"

# Update statement
$update = "{ $set: { city: \"San Francisco\" } }"

# Command to update documents
$command = "mongo --host $mongoHost --port $mongoPort --eval 'db.getSiblingDB(\"$databaseName\").$collectionName.updateMany($query, $update)'"
Invoke-Expression $command

Write-Host "Documents matching the query have been updated."