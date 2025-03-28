# Define Jenkins API endpoint and credentials
$JenkinsUrl = "http://your-jenkins-instance:8080"
$JenkinsUser = "your-username"
$JenkinsToken = "your-api-token"

# Define job name and build number
$JobName = "BuildJob"
$BuildNumber = 1

# Get build status
$BuildStatus = Invoke-RestMethod -Uri "$JenkinsUrl/job/$JobName/$BuildNumber/api/json" -Method Get -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JenkinsUser:$JenkinsToken")) )"}

# Output build status
$BuildStatus | Format-List