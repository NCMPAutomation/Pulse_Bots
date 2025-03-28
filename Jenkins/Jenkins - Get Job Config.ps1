# Define Jenkins API endpoint and credentials
$JenkinsUrl = "http://your-jenkins-instance:8080"
$JenkinsUser = "your-username"
$JenkinsToken = "your-api-token"

# Define job name
$JobName = "BuildJob"

# Get job configuration
$JobConfig = Invoke-RestMethod -Uri "$JenkinsUrl/job/$JobName/config.xml" -Method Get -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JenkinsUser:$JenkinsToken")) )"}

# Output job configuration
$JobConfig