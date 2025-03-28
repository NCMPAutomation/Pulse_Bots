# Define user list, default role, and role file
$NewUsers = @("user1", "user2", "user3") # Replace with actual user list
$DefaultRole = "Viewer"
$RoleFile = "C:\CustomApp\Roles.txt"

# Assign default role
foreach ($User in $NewUsers) {
    Add-Content -Path $RoleFile -Value "$User : $DefaultRole"
    Write-Output "$User has been assigned the $DefaultRole role."
}