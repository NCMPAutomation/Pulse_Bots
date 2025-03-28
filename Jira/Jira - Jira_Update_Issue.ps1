# Define Jira API endpoint and credentials
$JiraUrl = "https://your-jira-instance.atlassian.net"
$JiraUser = "your-email@example.com"
$JiraToken = "your-api-token"

# Define issue details
$IssueKey = "PROJ-123"
$NewSummary = "Updated issue summary"
$NewDescription = "Updated detailed description of the issue"

# Create JSON payload
$Payload = @{
    fields = @{
        summary = $NewSummary
        description = $NewDescription
    }
} | ConvertTo-Json -Compress

# Update the issue
Invoke-RestMethod -Uri "$JiraUrl/rest/api/2/issue/$IssueKey" -Method Put -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JiraUser:$JiraToken")) )"} -ContentType "application/json" -Body $Payload