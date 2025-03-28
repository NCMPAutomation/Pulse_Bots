# Define Jira API endpoint and credentials
$JiraUrl = "https://your-jira-instance.atlassian.net"
$JiraUser = "your-email@example.com"
$JiraToken = "your-api-token"

# Define issue details
$ProjectKey = "PROJ"
$Summary = "New issue summary"
$Description = "Detailed description of the issue"
$IssueType = "Task"

# Create JSON payload
$Payload = @{
    fields = @{
        project = @{
            key = $ProjectKey
        }
        summary = $Summary
        description = $Description
        issuetype = @{
            name = $IssueType
        }
    }
} | ConvertTo-Json -Compress

# Create the issue
Invoke-RestMethod -Uri "$JiraUrl/rest/api/2/issue" -Method Post -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JiraUser:$JiraToken")) )"} -ContentType "application/json" -Body $Payload