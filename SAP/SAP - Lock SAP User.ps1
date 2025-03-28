# Connect to SAP system (reuse connection script)

# Define user to lock
$username = "userToLock"

# Create RFC function to lock user
$rfcFunction = $sapDestination.Repository.CreateFunction("BAPI_USER_LOCK")
$rfcFunction.SetValue("USERNAME", $username)

# Execute function
$rfcFunction.Invoke($sapDestination)
Write-Output "User locked successfully"
