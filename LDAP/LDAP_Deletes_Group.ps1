# Define the LDAP server and the distinguished name (DN) of the group to be deleted
$ldapServer = "ldap://your-ldap-server"
$groupDN = "cn=GroupName,ou=Groups,dc=example,dc=com"

# Create a new DirectoryEntry object for the LDAP server
$ldapConnection = New-Object System.DirectoryServices.DirectoryEntry($ldapServer)

# Find the group to be deleted
$group = $ldapConnection.Children.Find($groupDN, "groupOfNames")

# Delete the group
$ldapConnection.Children.Remove($group)
$ldapConnection.CommitChanges()

Write-Host "Group 'GroupName' has been deleted from LDAP."
s