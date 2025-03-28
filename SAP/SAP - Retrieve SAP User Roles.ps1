# Connect to SAP system (reuse connection script)

# Define user to retrieve roles
$username = "existinguser"

# Create RFC function to get user roles
$rfcFunction = $sapDestination.Repository.CreateFunction("BAPI_USER_GET_DETAIL")
$rfcFunction.SetValue("USERNAME", $username)

# Execute function
$rfcFunction.Invoke($sapDestination)

# Retrieve roles
$userRoles = $rfcFunction.GetTable("PROFILES")
$userRoles
