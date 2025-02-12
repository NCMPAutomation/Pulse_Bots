# Define the folder path and user
$folderPath = "C:\ExampleFolder"
$user = "YourUsername"

# Define the permission rule
$permission = "FullControl"

# Get the current ACL (Access Control List) of the folder
$acl = Get-Acl -Path $folderPath

# Create a new FileSystemAccessRule object
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($user, $permission, "ContainerInherit,ObjectInherit", "None", "Allow")

# Add the new access rule to the ACL
$acl.SetAccessRule($accessRule)

# Apply the updated ACL to the folder
Set-Acl -Path $folderPath -AclObject $acl

# Verify the permission is added
(Get-Acl -Path $folderPath).Access | Where-Object { $_.IdentityReference -eq $user }