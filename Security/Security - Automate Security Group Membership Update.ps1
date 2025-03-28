# Import the Active Directory module
Import-Module ActiveDirectory

# Define user and group details
$UserName = "jdoe"
$GroupName = "SecurityGroup"

# Add the user to the security group
Add-ADGroupMember -Identity $GroupName -Members $UserName