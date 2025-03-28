# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user name and new password
$userName = "userToSetPassword"
$newPassword = "NewP@ssw0rd"

# Set the user password
Set-ADAccountPassword -Identity $userName -NewPassword (ConvertTo-SecureString $newPassword -AsPlainText -Force) -Reset
