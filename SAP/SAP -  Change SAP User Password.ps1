# Connect to SAP system (reuse connection script)

# Define user and new password
$username = "existinguser"
$newPassword = "newpassword"

# Create RFC function to change password
$rfcFunction = $sapDestination.Repository.CreateFunction("BAPI_USER_CHANGE")
$rfcFunction.SetValue("USERNAME", $username)
$rfcFunction.SetValue("PASSWORD", $newPassword)

# Execute function
$rfcFunction.Invoke($sapDestination)
Write-Output "Password changed successfully"
