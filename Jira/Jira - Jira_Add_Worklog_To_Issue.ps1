# Define Jira API endpoint and credentials
$JiraUrl = "https://your-jira-instance.atlassian.net"
$JiraUser = "your-email@example.com"
$JiraToken = "your-api-token"

# Define issue key and worklog details
$IssueKey = "PROJ-123"
$TimeSpent = "2h"
$Comment = "Worked on the issue"

# Create JSON payload
$Payload = @{
    timeSpent = $TimeSpent
    comment = $Comment
} | ConvertTo-Json -Compress

# Add worklog to the issue
Invoke-RestMethod -Uri "$JiraUrl/rest/api/2/issue/$IssueKey/worklog" -Method Post -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JiraUser:$JiraToken")) )"} -ContentType "application/json" -Body $Payload