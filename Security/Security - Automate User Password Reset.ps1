# Import the Active Directory module
Import-Module ActiveDirectory

# Define user details
$UserName = "jdoe"
$NewPassword = "NewP@ssw0rd"

# Reset the user password
Set-ADAccountPassword -Identity $UserName -NewPassword (ConvertTo-SecureString $NewPassword -AsPlainText -Force) -Reset