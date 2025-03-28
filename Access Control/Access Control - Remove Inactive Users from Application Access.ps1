# Define access file and inactivity threshold
$AccessFile = "C:\CustomApp\AccessList.txt"
$InactiveUsers = @("inactiveuser1", "inactiveuser2") # Replace with inactive user list

# Remove inactive users
(Get-Content $AccessFile) | Where-Object { $InactiveUsers -notcontains $_ } | Set-Content $AccessFile
Write-Output "Inactive users have been removed from access."