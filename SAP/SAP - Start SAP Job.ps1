# Connect to SAP system (reuse connection script)

# Define job name and job count
$jobName = "JOB_NAME"
$jobCount = "000123"

# Create RFC function to start job
$rfcFunction = $sapDestination.Repository.CreateFunction("BAPI_XBP_JOB_START_IMMEDIATELY")
$rfcFunction.SetValue("JOBNAME", $jobName)
$rfcFunction.SetValue("JOBCOUNT", $jobCount)

# Execute function
$rfcFunction.Invoke($sapDestination)
Write-Output "Job started successfully"
