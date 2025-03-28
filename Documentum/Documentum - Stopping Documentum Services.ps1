# Define the Documentum service name
$ServiceName = "DocumentumService"

# Stop the service
Stop-Service -Name $ServiceName
Write-Host "Service $ServiceName has been stopped"