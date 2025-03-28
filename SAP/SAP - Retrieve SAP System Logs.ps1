# Connect to SAP system (reuse connection script)

# Define log parameters
$logDate = "20230327"
$logTime = "000000"

# Create RFC function to get system logs
$rfcFunction = $sapDestination.Repository.CreateFunction("RFC_READ_SYSLOG")
$rfcFunction.SetValue("DATE", $logDate)
$rfcFunction.SetValue("TIME", $logTime)

# Execute function
$rfcFunction.Invoke($sapDestination)

# Retrieve logs
$systemLogs = $rfcFunction.GetTable("SYSLOG")
$systemLogs
