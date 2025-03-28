# Define Jira API endpoint and credentials
$JiraUrl = "https://your-jira-instance.atlassian.net"
$JiraUser = "your-email@example.com"
$JiraToken = "your-api-token"

# Define issue key
$IssueKey = "PROJ-123"

# Get issue history
$IssueHistory = Invoke-RestMethod -Uri "$JiraUrl/rest/api/2/issue/$IssueKey/changelog" -Method Get -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JiraUser:$JiraToken")) )"}

# Output issue history
$IssueHistory.values | Format-Table