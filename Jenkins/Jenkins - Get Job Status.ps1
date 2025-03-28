# Define Jenkins API endpoint and credentials
$JenkinsUrl = "http://your-jenkins-instance:8080"
$JenkinsUser = "your-username"
$JenkinsToken = "your-api-token"

# Define job name
$JobName = "BuildJob"

# Get job status
$JobStatus = Invoke-RestMethod -Uri "$JenkinsUrl/job/$JobName/api/json" -Method Get -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JenkinsUser:$JenkinsToken")) )"}

# Output job status
$JobStatus | Format-List