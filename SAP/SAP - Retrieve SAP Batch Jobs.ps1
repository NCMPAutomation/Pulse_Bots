# Connect to SAP system (reuse connection script)

# Define job selection criteria
$jobName = "*"
$jobStatus = "SCHEDULED"

# Create RFC function to get batch jobs
$rfcFunction = $sapDestination.Repository.CreateFunction("BAPI_XBP_JOB_SELECT")
$rfcFunction.SetValue("JOBNAME", $jobName)
$rfcFunction.SetValue("STATUS", $jobStatus)

# Execute function
$rfcFunction.Invoke($sapDestination)

# Retrieve batch jobs
$batchJobs = $rfcFunction.GetTable("JOB_HEAD")
$batchJobs
