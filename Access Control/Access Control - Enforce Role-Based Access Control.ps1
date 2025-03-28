# Define role file and role-based restrictions
$RoleFile = "C:\CustomApp\Roles.txt"
$RestrictedRole = "Viewer"

# Enforce access restrictions
Get-Content $RoleFile | ForEach-Object {
    $Split = $_ -split ':'
    $User = $Split[0].Trim()
    $Role = $Split[1].Trim()
    if ($Role -eq $RestrictedRole) {
        Write-Output "$User has limited access due to their $RestrictedRole role."
    }
}