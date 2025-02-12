# Define the user and group
$user = "YourUsername"
$group = "Administrators"

# Add the user to the Administrators group
Add-LocalGroupMember -Group $group -Member $user

# Verify the user is added to the group
Get-LocalGroupMember -Group $group