# Connect to SAP system (reuse connection script)

# Define user to unlock
$username = "userToUnlock"

# Create RFC function to unlock user
$rfcFunction = $sapDestination.Repository.CreateFunction("BAPI_USER_UNLOCK")
$rfcFunction.SetValue("USERNAME", $username)

# Execute function
$rfcFunction.Invoke($sapDestination)
Write-Output "User unlocked successfully"
