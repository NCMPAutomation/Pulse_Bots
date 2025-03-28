# Define Jenkins API endpoint and credentials
$JenkinsUrl = "http://your-jenkins-instance:8080"
$JenkinsUser = "your-username"
$JenkinsToken = "your-api-token"

# Define node name
$NodeName = "Node1"

# Get node information
$NodeInfo = Invoke-RestMethod -Uri "$JenkinsUrl/computer/$NodeName/api/json" -Method Get -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JenkinsUser:$JenkinsToken")) )"}

# Output node information
$NodeInfo | Format-List