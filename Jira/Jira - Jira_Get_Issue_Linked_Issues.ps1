# Define Jira API endpoint and credentials
$JiraUrl = "https://your-jira-instance.atlassian.net"
$JiraUser = "your-email@example.com"
$JiraToken = "your-api-token"

# Define issue key
$IssueKey = "PROJ-123"

# Get linked issues
$LinkedIssues = Invoke-RestMethod -Uri "$JiraUrl/rest/api/2/issue/$IssueKey?fields=issuelinks" -Method Get -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JiraUser:$JiraToken")) )"}

# Output linked issues
$LinkedIssues.fields.issuelinks | Format-Table