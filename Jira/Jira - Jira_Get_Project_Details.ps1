# Define Jira API endpoint and credentials
$JiraUrl = "https://your-jira-instance.atlassian.net"
$JiraUser = "your-email@example.com"
$JiraToken = "your-api-token"

# Define project key
$ProjectKey = "PROJ"

# Get project details
$ProjectDetails = Invoke-RestMethod -Uri "$JiraUrl/rest/api/2/project/$ProjectKey" -Method Get -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JiraUser:$JiraToken")) )"}

# Output project details
$ProjectDetails | Format-List