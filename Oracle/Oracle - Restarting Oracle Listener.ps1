# Stop the Oracle listener
& lsnrctl stop
Write-Host "Listener stopped"

# Start the Oracle listener
& lsnrctl start
Write-Host "Listener started"