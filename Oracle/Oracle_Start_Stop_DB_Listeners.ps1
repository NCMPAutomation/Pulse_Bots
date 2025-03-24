# Parameters
$OracleHome = "C:\app\oracle\product\19.0.0\dbhome_1"  # Replace with the path to your Oracle Home directory
$ListenerName = "LISTENER"                            # Replace with the name of your listener
$Action = "start"                                     # Replace with "start" or "stop" depending on the action

# Set Oracle environment variables
$env:ORACLE_HOME = $OracleHome
$env:PATH = "$env:ORACLE_HOME\bin;$env:PATH"

# Perform the action on the listener
if ($Action -eq "start") {
    Invoke-Expression "lsnrctl start $ListenerName"
    Write-Host "Listener '$ListenerName' has been started successfully."
} elseif ($Action -eq "stop") {
    Invoke-Expression "lsnrctl stop $ListenerName"
    Write-Host "Listener '$ListenerName' has been stopped successfully."
} else {
    Write-Host "Invalid action specified. Use 'start' or 'stop'."
}
