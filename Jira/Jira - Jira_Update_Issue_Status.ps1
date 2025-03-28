# Define Jira API endpoint and credentials
$JiraUrl = "https://your-jira-instance.atlassian.net"
$JiraUser = "your-email@example.com"
$JiraToken = "your-api-token"

# Define issue key and new status
$IssueKey = "PROJ-123"
$NewStatus = "In Progress"

# Get transition ID for the new status
$Transitions = Invoke-RestMethod -Uri "$JiraUrl/rest/api/2/issue/$IssueKey/transitions" -Method Get -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JiraUser:$JiraToken")) )"}
$TransitionId = ($Transitions.transitions | Where-Object { $_.name -eq $NewStatus }).id

# Create JSON payload
$Payload = @{
    transition = @{
        id = $TransitionId
    }
} | ConvertTo-Json -Compress

# Update the issue status
Invoke-RestMethod -Uri "$JiraUrl/rest/api/2/issue/$IssueKey/transitions" -Method Post -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JiraUser:$JiraToken")) )"} -ContentType "application/json" -Body $Payload