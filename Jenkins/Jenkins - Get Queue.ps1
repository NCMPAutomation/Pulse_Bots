# Define Jenkins API endpoint and credentials
$JenkinsUrl = "http://your-jenkins-instance:8080"
$JenkinsUser = "your-username"
$JenkinsToken = "your-api-token"

# Get queue
$Queue = Invoke-RestMethod -Uri "$JenkinsUrl/queue/api/json" -Method Get -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JenkinsUser:$JenkinsToken")) )"}

# Output queue
$Queue.items | Format-Table