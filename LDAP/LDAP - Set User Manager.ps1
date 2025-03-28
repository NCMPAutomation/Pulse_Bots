# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user and manager
$userName = "userToSetManager"
$manager = "managerUserName"

# Set the user's manager
Set-ADUser -Identity $userName -Manager $manager
