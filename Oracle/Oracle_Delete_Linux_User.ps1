# Parameters
$LinuxHost = "192.168.1.100"       # Replace with your Linux server hostname or IP
$AdminUsername = "yourAdminUsername" # Replace with your Linux administrator's username
$AdminPassword = "yourAdminPassword" # Replace with the administrator's password
$UserToDelete = "userToDelete"       # Replace with the username of the account to delete

# Command to delete the user
$DeleteUserCommand = @"
sudo userdel $UserToDelete && sudo rm -r /home/$UserToDelete
"@

# Use SSH to execute the command remotely
$SecurePassword = ConvertTo-SecureString $AdminPassword -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($AdminUsername, $SecurePassword)
Invoke-Command -ComputerName $LinuxHost -Credential $Credential -ScriptBlock {
    param ($DeleteUserCommand)
    Invoke-Expression $DeleteUserCommand
} -ArgumentList $DeleteUserCommand

# Confirmation
Write-Host "User '$UserToDelete' has been deleted successfully from the Linux server."
