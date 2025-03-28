# Define Jenkins API endpoint and credentials
$JenkinsUrl = "http://your-jenkins-instance:8080"
$JenkinsUser = "your-username"
$JenkinsToken = "your-api-token"

# Define node name
$NodeName = "OldNode"

# Delete the node
Invoke-RestMethod -Uri "$JenkinsUrl/computer/$NodeName/doDelete" -Method Post -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JenkinsUser:$JenkinsToken")) )"}