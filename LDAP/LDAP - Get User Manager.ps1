# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user name
$userName = "userToGetManager"

# Get the user's manager
Get-ADUser -Identity $userName -Properties Manager | Select-Object Name, Manager
