# Define the LDAP server and the distinguished name (DN) where the user will be created
$ldapServer = "ldap://your-ldap-server"
$baseDN = "ou=Users,dc=example,dc=com"

# Define the new user details
$newUserDN = "uid=newuser,ou=Users,dc=example,dc=com"
$newUserAttributes = @{
    objectClass = @("top", "person", "organizationalPerson", "inetOrgPerson")
    cn = "New User"
    sn = "User"
    uid = "newuser"
    userPassword = "Password123"
}

# Create a new DirectoryEntry object for the LDAP server
$ldapConnection = New-Object System.DirectoryServices.DirectoryEntry($ldapServer)

# Create a new user object in the LDAP directory
$newUser = $ldapConnection.Children.Add($newUserDN, "user")
foreach ($attribute in $newUserAttributes.Keys) {
    $newUser.Properties[$attribute].Value = $newUserAttributes[$attribute]
}

# Commit the new user to the LDAP directory
$newUser.CommitChanges()
$ldapConnection.CommitChanges()

Write-Host "User account 'newuser' has been created in LDAP."
