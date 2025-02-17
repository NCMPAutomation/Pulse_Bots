# Define the LDAP server and the distinguished name (DN) where the group will be created
$ldapServer = "ldap://your-ldap-server"
$baseDN = "ou=Groups,dc=example,dc=com"

# Define the new group details
$newGroupDN = "cn=NewGroup,ou=Groups,dc=example,dc=com"
$newGroupAttributes = @{
    objectClass = @("top", "groupOfNames")
    cn = "NewGroup"
    description = "Description of the new group"
    member = @() # Initialize as an empty array, add member DNs as needed
}

# Create a new DirectoryEntry object for the LDAP server
$ldapConnection = New-Object System.DirectoryServices.DirectoryEntry($ldapServer)

# Create a new group object in the LDAP directory
$newGroup = $ldapConnection.Children.Add($newGroupDN, "groupOfNames")
foreach ($attribute in $newGroupAttributes.Keys) {
    $newGroup.Properties[$attribute].Value = $newGroupAttributes[$attribute]
}

# Commit the new group to the LDAP directory
$newGroup.CommitChanges()
$ldapConnection.CommitChanges()

Write-Host "Group 'NewGroup' has been created in LDAP."
