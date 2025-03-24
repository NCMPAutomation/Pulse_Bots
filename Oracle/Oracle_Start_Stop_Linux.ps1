# Parameters
$LinuxHost = "192.168.1.100"        # Replace with your Linux server hostname or IP
$Username = "yourUsername"          # Replace with your Linux username
$Password = "yourPassword"          # Replace with your Linux password
$Action = "start"                   # Replace with "start" or "stop" to control database services

# Command to manage Oracle database services
if ($Action -eq "start") {
    $ServiceCommand = "sudo systemctl start oracle-database"
    Write-Host "Starting Oracle database services..."
} elseif ($Action -eq "stop") {
    $ServiceCommand = "sudo systemctl stop oracle-database"
    Write-Host "Stopping Oracle database services..."
} else {
    Write-Host "Invalid action. Use 'start' or 'stop'."
    return
}

# Use SSH to execute the command remotely
$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($Username, $SecurePassword)
Invoke-Command -ComputerName $LinuxHost -Credential $Credential -ScriptBlock {
    param ($ServiceCommand)
    Invoke-Expression $ServiceCommand
} -ArgumentList $ServiceCommand

# Confirmation
Write-Host "Oracle database service '$Action' action completed."
