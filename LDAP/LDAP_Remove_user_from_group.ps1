# Define the LDAP server and the distinguished name (DN) of the group
$ldapServer = "ldap://your-ldap-server"
$groupDN = "cn=GroupName,ou=Groups,dc=example,dc=com"

# Define the distinguished name (DN) of the user to be removed
$userDN = "uid=userToRemove,ou=Users,dc=example,dc=com"

# Create a new DirectoryEntry object for the LDAP server
$ldapConnection = New-Object System.DirectoryServices.DirectoryEntry($ldapServer)

# Find the group to be updated
$group = $ldapConnection.Children.Find($groupDN, "groupOfNames")

# Remove the user from the group
$group.Properties["member"].Remove($userDN)
$group.CommitChanges()

Write-Host "User account 'userToRemove' has been removed from group 'GroupName'."
s