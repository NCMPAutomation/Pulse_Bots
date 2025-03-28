# Define Jenkins API endpoint and credentials
$JenkinsUrl = "http://your-jenkins-instance:8080"
$JenkinsUser = "your-username"
$JenkinsToken = "your-api-token"

# Define queue item ID
$QueueItemId = 123

# Cancel queue item
Invoke-RestMethod -Uri "$JenkinsUrl/queue/cancelItem?id=$QueueItemId" -Method Post -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JenkinsUser:$JenkinsToken")) )"}