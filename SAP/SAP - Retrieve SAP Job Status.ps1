# Connect to SAP system (reuse connection script)

# Define job name and job count
$jobName = "JOB_NAME"
$jobCount = "000123"

# Create RFC function to get job status
$rfcFunction = $sapDestination.Repository.CreateFunction("BAPI_XBP_JOB_STATUS_GET")
$rfcFunction.SetValue("JOBNAME", $jobName)
$rfcFunction.SetValue("JOBCOUNT", $jobCount)

# Execute function
$rfcFunction.Invoke($sapDestination)

# Retrieve job status
$jobStatus = $rfcFunction.GetStructure("JOB_STATUS")
$jobStatus
