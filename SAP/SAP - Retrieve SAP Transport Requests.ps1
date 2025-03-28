# Connect to SAP system (reuse connection script)

# Create RFC function to get transport requests
$rfcFunction = $sapDestination.Repository.CreateFunction("BAPI_TR_GETLIST")

# Execute function
$rfcFunction.Invoke($sapDestination)

# Retrieve transport requests
$transportRequests = $rfcFunction.GetTable("REQUESTS")
$transportRequests
