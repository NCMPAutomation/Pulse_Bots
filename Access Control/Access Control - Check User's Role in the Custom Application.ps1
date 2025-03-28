# Define user and role file
$UserName = "jdoe"
$RoleFile = "C:\CustomApp\Roles.txt"

# Check and display user's role
Get-Content $RoleFile | Where-Object { $_ -like "$UserName *" }