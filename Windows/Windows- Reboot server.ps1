# Define the server name (use "localhost" for the local machine)
$serverName = "4.240.50.82"
 
# Define the username and password
$username = "adminuser"
$password = ""
 
# Convert the password to a secure string
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
 
# Create the credential object
$credential = New-Object System.Management.Automation.PSCredential($username, $securePassword)
 
# Restart the server
Restart-Computer -ComputerName $serverName -Force -Wait -Credential $credential
 
Write-Output "The server $serverName is being restarted."