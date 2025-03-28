# Define user, role, and role file
$UserName = "jdoe"
$Role = "Admin"
$RoleFile = "C:\CustomApp\Roles.txt"

# Assign role
Add-Content -Path $RoleFile -Value "$UserName : $Role"
Write-Output "$UserName has been assigned the $Role role for the custom application."