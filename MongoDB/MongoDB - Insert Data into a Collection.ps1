# Define MongoDB connection parameters
$mongoHost = "localhost"
$mongoPort = "27017"
$databaseName = "your_database"
$collectionName = "your_collection"

# Document to insert
$document = "{ name: \"John Doe\", age: 30, city: \"New York\" }"

# Command to insert data
$command = "mongo --host $mongoHost --port $mongoPort --eval 'db.getSiblingDB(\"$databaseName\").$collectionName.insert($document)'"
Invoke-Expression $command

Write-Host "Document inserted into collection $collectionName."