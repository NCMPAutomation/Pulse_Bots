# Define Jira API endpoint and credentials
$JiraUrl = "https://your-jira-instance.atlassian.net"
$JiraUser = "your-email@example.com"
$JiraToken = "your-api-token"

# Define issue key and watcher
$IssueKey = "PROJ-123"
$Watcher = "watcher-email@example.com"

# Remove watcher from the issue
Invoke-RestMethod -Uri "$JiraUrl/rest/api/2/issue/$IssueKey/watchers?username=$Watcher" -Method Delete -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JiraUser:$JiraToken")) )"}