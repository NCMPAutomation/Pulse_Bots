# Define access file and role file
$AccessFile = "C:\CustomApp\AccessList.txt"
$RoleFile = "C:\CustomApp\Roles.txt"

# Identify users without roles
$UsersWithAccess = Get-Content $AccessFile
$UsersWithRoles = Get-Content $RoleFile | ForEach-Object { ($_ -split ':')[0].Trim() }

$UsersWithoutRoles = $UsersWithAccess | Where-Object { $UsersWithRoles -notcontains $_ }
Write-Output "Users without roles:"
$UsersWithoutRoles

