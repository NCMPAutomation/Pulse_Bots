# Define the LDAP server and the distinguished name (DN) of the user to be deleted
$ldapServer = "ldap://your-ldap-server"
$userDN = "uid=userToDelete,ou=Users,dc=example,dc=com"

# Create a new DirectoryEntry object for the LDAP server
$ldapConnection = New-Object System.DirectoryServices.DirectoryEntry($ldapServer)

# Find the user to be deleted
$user = $ldapConnection.Children.Find($userDN, "user")

# Delete the user
$ldapConnection.Children.Remove($user)
$ldapConnection.CommitChanges()

Write-Host "User account 'userToDelete' has been deleted from LDAP."
