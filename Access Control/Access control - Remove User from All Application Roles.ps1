# Define user and role file
$UserName = "jdoe"
$RoleFile = "C:\CustomApp\Roles.txt"

# Remove user's roles
(Get-Content $RoleFile) | Where-Object { $_ -notlike "$UserName *" } | Set-Content $RoleFile
Write-Output "All roles removed for $UserName in the custom application."