# Define Jenkins API endpoint and credentials
$JenkinsUrl = "http://your-jenkins-instance:8080"
$JenkinsUser = "your-username"
$JenkinsToken = "your-api-token"

# Restart Jenkins
Invoke-RestMethod -Uri "$JenkinsUrl/safeRestart" -Method Post -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JenkinsUser:$JenkinsToken")) )"}