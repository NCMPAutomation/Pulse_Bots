# Connect to SAP system (reuse connection script)

# Define transport request number
$requestNumber = "TRANSPORT_REQUEST_NUMBER"

# Create RFC function to approve transport request
$rfcFunction = $sapDestination.Repository.CreateFunction("BAPI_TR_APPROVE")
$rfcFunction.SetValue("REQUEST", $requestNumber)

# Execute function
$rfcFunction.Invoke($sapDestination)
Write-Output "Transport request approved successfully"
