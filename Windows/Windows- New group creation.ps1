# Define the parameters for the new group
$params = @{
    Name        = "NewLocalGroup"
    Description = "This is a new local group"
}

# Create the new local group
New-LocalGroup @params

# Optionally, add members to the new group
Add-LocalGroupMember -Group "NewLocalGroup" -Member "ExistingUser"