# Define Jenkins API endpoint and credentials
$JenkinsUrl = "http://your-jenkins-instance:8080"
$JenkinsUser = "your-username"
$JenkinsToken = "your-api-token"

# Get installed plugins
$Plugins = Invoke-RestMethod -Uri "$JenkinsUrl/pluginManager/api/json?depth=1" -Method Get -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JenkinsUser:$JenkinsToken")) )"}

# Output installed plugins
$Plugins.plugins | Format-Table