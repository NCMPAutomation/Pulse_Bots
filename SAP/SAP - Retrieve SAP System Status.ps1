# Connect to SAP system (reuse connection script)

# Create RFC function to get system status
$rfcFunction = $sapDestination.Repository.CreateFunction("RFC_SYSTEM_INFO")

# Execute function
$rfcFunction.Invoke($sapDestination)

# Retrieve system status
$systemStatus = $rfcFunction.GetStructure("RFCSI_EXPORT")
$systemStatus
