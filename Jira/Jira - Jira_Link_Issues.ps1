# Define Jira API endpoint and credentials
$JiraUrl = "https://your-jira-instance.atlassian.net"
$JiraUser = "your-email@example.com"
$JiraToken = "your-api-token"

# Define issue keys to link
$IssueKey1 = "PROJ-123"
$IssueKey2 = "PROJ-456"
$LinkType = "Relates"

# Create JSON payload
$Payload = @{
    type = @{
        name = $LinkType
    }
    inwardIssue = @{
        key = $IssueKey1
    }
    outwardIssue = @{
        key = $IssueKey2
    }
} | ConvertTo-Json -Compress

# Link the issues
Invoke-RestMethod -Uri "$JiraUrl/rest/api/2/issueLink" -Method Post -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JiraUser:$JiraToken")) )"} -ContentType "application/json" -Body $Payload