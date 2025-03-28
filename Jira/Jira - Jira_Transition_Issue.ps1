# Define Jira API endpoint and credentials
$JiraUrl = "https://your-jira-instance.atlassian.net"
$JiraUser = "your-email@example.com"
$JiraToken = "your-api-token"

# Define issue key and transition ID
$IssueKey = "PROJ-123"
$TransitionId = 31  # Example transition ID

# Create JSON payload
$Payload = @{
    transition = @{
        id = $TransitionId
    }
} | ConvertTo-Json -Compress

# Transition the issue
Invoke-RestMethod -Uri "$JiraUrl/rest/api/2/issue/$IssueKey/transitions" -Method Post -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JiraUser:$JiraToken")) )"} -ContentType "application/json" -Body $Payload