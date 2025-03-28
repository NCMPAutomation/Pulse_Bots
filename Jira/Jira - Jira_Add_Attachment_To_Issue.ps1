# Define Jira API endpoint and credentials
$JiraUrl = "https://your-jira-instance.atlassian.net"
$JiraUser = "your-email@example.com"
$JiraToken = "your-api-token"

# Define issue key and attachment file path
$IssueKey = "PROJ-123"
$FilePath = "C:\path\to\attachment.txt"

# Add attachment to the issue
Invoke-RestMethod -Uri "$JiraUrl/rest/api/2/issue/$IssueKey/attachments" -Method Post -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JiraUser:$JiraToken")) )"; "X-Atlassian-Token" = "no-check"} -InFile $FilePath -ContentType "multipart/form-data"