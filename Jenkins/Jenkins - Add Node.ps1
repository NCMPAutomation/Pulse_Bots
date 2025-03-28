# Define Jenkins API endpoint and credentials
$JenkinsUrl = "http://your-jenkins-instance:8080"
$JenkinsUser = "your-username"
$JenkinsToken = "your-api-token"

# Define node details
$NodeName = "NewNode"
$NodeDescription = "New Jenkins Node"
$RemoteFS = "C:\\Jenkins"
$NumExecutors = 2
$NodeLabels = "windows"

# Create JSON payload
$Payload = @{
    name = $NodeName
    nodeDescription = $NodeDescription
    numExecutors = $NumExecutors
    remoteFS = $RemoteFS
    labelString = $NodeLabels
    mode = "NORMAL"
    type = "hudson.slaves.DumbSlave"
    retentionStrategy = @{
        "stapler-class" = "hudson.slaves.RetentionStrategy$Always"
    }
    launcher = @{
        "stapler-class" = "hudson.slaves.JNLPLauncher"
    }
} | ConvertTo-Json -Compress

# Add the node
Invoke-RestMethod -Uri "$JenkinsUrl/computer/doCreateItem?name=$NodeName&type=hudson.slaves.DumbSlave" -Method Post -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JenkinsUser:$JenkinsToken")) )"} -ContentType "application/json" -Body $Payload