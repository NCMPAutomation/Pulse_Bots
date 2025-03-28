# Define MongoDB connection parameters
$mongoHost = "localhost"
$mongoPort = "27017"
$databaseName = "your_database"
$collectionName = "your_collection"
$outputPath = "C:\ExportedCollection.csv"

# Command to export collection to CSV
$command = "mongoexport --host $mongoHost --port $mongoPort --db $databaseName --collection $collectionName --type=csv --out $outputPath --fields name,age,city"
Invoke-Expression $command

Write-Host "Collection $collectionName exported to $outputPath."