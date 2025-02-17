# Define the LDAP server and the distinguished name (DN) of the group
$ldapServer = "ldap://your-ldap-server"
$groupDN = "cn=GroupName,ou=Groups,dc=example,dc=com"

# Define the distinguished name (DN) of the user to be added
$userDN = "uid=userToAdd,ou=Users,dc=example,dc=com"

# Create a new DirectoryEntry object for the LDAP server
$ldapConnection = New-Object System.DirectoryServices.DirectoryEntry($ldapServer)

# Find the group to be updated
$group = $ldapConnection.Children.Find($groupDN, "groupOfNames")

# Add the user to the group
$group.Properties["member"].Add($userDN)
$group.CommitChanges()

Write-Host "User account 'userToAdd' has been added to group 'GroupName'."
