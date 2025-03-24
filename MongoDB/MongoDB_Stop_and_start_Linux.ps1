# Parameters
$LinuxHost = "192.168.1.100"      # Replace with your Linux server's IP or hostname
$Username = "yourUsername"        # Replace with your Linux username
$Password = "yourPassword"        # Replace with your Linux password
$ServiceName = "mongod"           # MongoDB service name

# Stopping MongoDB service
Write-Host "Stopping MongoDB service..."
Invoke-Command -ComputerName $LinuxHost -Credential (New-Object PSCredential $Username, (ConvertTo-SecureString $Password -AsPlainText -Force)) -ScriptBlock {
    sudo systemctl stop $using:ServiceName
}
Write-Host "MongoDB service stopped."

# Starting MongoDB service
Write-Host "Starting MongoDB service..."
Invoke-Command -ComputerName $LinuxHost -Credential (New-Object PSCredential $Username, (ConvertTo-SecureString $Password -AsPlainText -Force)) -ScriptBlock {
    sudo systemctl start $using:ServiceName
}
Write-Host "MongoDB service started."

# Verifying the status of MongoDB service
Write-Host "Checking the status of MongoDB service..."
Invoke-Command -ComputerName $LinuxHost -Credential (New-Object PSCredential $Username, (ConvertTo-SecureString $Password -AsPlainText -Force)) -ScriptBlock {
    sudo systemctl status $using:ServiceName
}
