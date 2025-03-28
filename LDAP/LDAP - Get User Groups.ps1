# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user name
$userName = "userToGetGroups"

# Get the groups the user is a member of
Get-ADUser -Identity $userName -Properties MemberOf | Select-Object -ExpandProperty MemberOf
