# Connect to SAP system (reuse connection script)

# Define user to retrieve details
$username = "existinguser"

# Create RFC function to get user details
$rfcFunction = $sapDestination.Repository.CreateFunction("BAPI_USER_GET_DETAIL")
$rfcFunction.SetValue("USERNAME", $username)

# Execute function
$rfcFunction.Invoke($sapDestination)

# Retrieve details
$userDetails = $rfcFunction.GetStructure("USERDETAIL")
$userDetails
