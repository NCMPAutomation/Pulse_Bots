# Define MongoDB connection parameters
$mongoHost = "localhost"
$mongoPort = "27017"
$databaseName = "your_database"
$collectionName = "your_collection"
$csvPath = "C:\InputData.csv"

# Command to import CSV into the collection
$command = "mongoimport --host $mongoHost --port $mongoPort --db $databaseName --collection $collectionName --type=csv --file $csvPath --headerline"
Invoke-Expression $command

Write-Host "Data from $csvPath imported into collection $collectionName."