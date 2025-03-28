# Define Jenkins API endpoint and credentials
$JenkinsUrl = "http://your-jenkins-instance:8080"
$JenkinsUser = "your-username"
$JenkinsToken = "your-api-token"

# Define plugin name
$PluginName = "git"

# Create JSON payload
$Payload = @{
    dynamicLoad = true
    plugins = @(@{name = $PluginName})
} | ConvertTo-Json -Compress

# Install the plugin
Invoke-RestMethod -Uri "$JenkinsUrl/pluginManager/installNecessaryPlugins" -Method Post -Headers @{Authorization = "Basic $( [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$JenkinsUser:$JenkinsToken")) )"} -ContentType "application/json" -Body $Payload