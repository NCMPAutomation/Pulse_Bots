# Define the Linux machine's hostname or IP address
$linuxMachine = "YourLinuxMachineIP"

# Ping the Linux machine to check its heartbeat
$pingResult = Test-Connection -ComputerName $linuxMachine -Count 4 -ErrorAction SilentlyContinue

# Check the result and display the heartbeat status
if ($pingResult) {
    Write-Output "Heartbeat is healthy. $linuxMachine is responding to ping."
} else {
    Write-Output "Heartbeat failure. $linuxMachine is not responding to ping."
}