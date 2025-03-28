# Define Jenkins API endpoint and credentials
$JenkinsUrl = "http://your-jenkins-instance:8080"
$JenkinsUser = "your-username"
$JenkinsToken = "your-api-token"

# Define job name and build number
$JobName = "BuildJob"
$BuildNumber = 1

# Get build log
$BuildLog = Invoke-RestMethod -Uri "$JenkinsUrl/job/$JobName/$BuildNumber/consoleText" -Method Get -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JenkinsUser:$JenkinsToken")) )"}

# Output build log
$BuildLog