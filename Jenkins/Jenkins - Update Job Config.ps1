# Define Jenkins API endpoint and credentials
$JenkinsUrl = "http://your-jenkins-instance:8080"
$JenkinsUser = "your-username"
$JenkinsToken = "your-api-token"

# Define job name and new configuration XML
$JobName = "BuildJob"
$NewConfigXml = Get-Content -Path "C:\path\to\new_config.xml"

# Update job configuration
Invoke-RestMethod -Uri "$JenkinsUrl/job/$JobName/config.xml" -Method Post -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JenkinsUser:$JenkinsToken")) )"} -ContentType "application/xml" -Body $NewConfigXml