# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user name and description
$userName = "userToDescribe"
$description = "This is a test user"

# Set the user description
Set-ADUser -Identity $userName -Description $description
