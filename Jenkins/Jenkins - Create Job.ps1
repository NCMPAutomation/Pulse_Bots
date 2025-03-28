# Define Jenkins API endpoint and credentials
$JenkinsUrl = "http://your-jenkins-instance:8080"
$JenkinsUser = "your-username"
$JenkinsToken = "your-api-token"

# Define job name and configuration XML
$JobName = "NewJob"
$ConfigXml = Get-Content -Path "C:\path\to\config.xml"

# Create the job
Invoke-RestMethod -Uri "$JenkinsUrl/createItem?name=$JobName" -Method Post -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JenkinsUser:$JenkinsToken")) )"} -ContentType "application/xml" -Body $ConfigXml