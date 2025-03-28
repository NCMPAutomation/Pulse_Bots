# Define MongoDB connection parameters
$mongoHost = "localhost"
$mongoPort = "27017"

# Test connection status
$command = "mongo --host $mongoHost --port $mongoPort --eval 'db.runCommand({ connectionStatus: 1 })'"
$response = Invoke-Expression $command

Write-Host "Connection Status:"
Write-Host $response