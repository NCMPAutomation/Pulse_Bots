# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user name
$userName = "userToGetLastLogon"

# Get the user's last logon time
Get-ADUser -Identity $userName -Properties LastLogonDate | Select-Object Name, LastLogonDate
