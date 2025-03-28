# Define the file or folder path
$Path = "C:\SensitiveData"

# Get the current ACL
$ACL = Get-Acl -Path $Path

# Define new access rule
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Domain\User", "FullControl", "Allow")

# Add the new access rule
$ACL.AddAccessRule($AccessRule)

# Set the updated ACL
Set-Acl -Path $Path -AclObject $ACL