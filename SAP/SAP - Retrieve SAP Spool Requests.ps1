# Connect to SAP system (reuse connection script)

# Create RFC function to get spool requests
$rfcFunction = $sapDestination.Repository.CreateFunction("RSPO_SPOOL_READ")

# Execute function
$rfcFunction.Invoke($sapDestination)

# Retrieve spool requests
$spoolRequests = $rfcFunction.GetTable("SPOOL_LIST")
$spoolRequests
