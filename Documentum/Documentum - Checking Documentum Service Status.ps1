# Define the Documentum service name
$ServiceName = "DocumentumService"

# Get service status
$Service = Get-Service -Name $ServiceName
Write-Host "Service $ServiceName is currently $($Service.Status)"