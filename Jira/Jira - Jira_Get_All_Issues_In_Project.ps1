# Define Jira API endpoint and credentials
$JiraUrl = "https://your-jira-instance.atlassian.net"
$JiraUser = "your-email@example.com"
$JiraToken = "your-api-token"

# Define project key
$ProjectKey = "PROJ"

# Get all issues in the project
$Issues = Invoke-RestMethod -Uri "$JiraUrl/rest/api/2/search?jql=project=$ProjectKey" -Method Get -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JiraUser:$JiraToken")) )"}

# Output all issues
$Issues.issues | Format-Table