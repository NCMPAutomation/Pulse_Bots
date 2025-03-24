# Parameters
$LinuxHost = "192.168.1.100"       # Replace with your Linux server hostname or IP
$Username = "yourAdminUsername"    # Replace with your Linux administrator's username
$Password = "yourAdminPassword"    # Replace with the administrator's password
$NewUser = "newLinuxUser"          # Replace with the username of the new user
$UserPassword = "securePassword"   # Replace with a secure password for the new user

# Command to create the new user
$CreateUserCommand = @"
sudo useradd $NewUser && echo '$NewUser:$UserPassword' | sudo chpasswd
"@

# Use SSH to execute the command remotely
$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($Username, $SecurePassword)
Invoke-Command -ComputerName $LinuxHost -Credential $Credential -ScriptBlock {
    param ($CreateUserCommand)
    Invoke-Expression $CreateUserCommand
} -ArgumentList $CreateUserCommand

# Confirmation
Write-Host "User '$NewUser' has been created successfully on the Linux server."
