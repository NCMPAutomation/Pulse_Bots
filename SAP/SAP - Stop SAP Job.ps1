# Connect to SAP system (reuse connection script)

# Define job name and job count
$jobName = "JOB_NAME"
$jobCount = "000123"

# Create RFC function to stop job
$rfcFunction = $sapDestination.Repository.CreateFunction("BAPI_XBP_JOB_ABORT")
$rfcFunction.SetValue("JOBNAME", $jobName)
$rfcFunction.SetValue("JOBCOUNT", $jobCount)

# Execute function
$rfcFunction.Invoke($sapDestination)
Write-Output "Job stopped successfully"
