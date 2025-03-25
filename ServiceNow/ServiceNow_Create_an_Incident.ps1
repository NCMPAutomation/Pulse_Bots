# Define ServiceNow instance details
$instance = "your_instance_name"  # Replace with your ServiceNow instance name
$username = "your_username"       # Replace with your ServiceNow username
$password = "your_password"       # Replace with your ServiceNow password

# Define the API endpoint for creating incidents
$apiUrl = "https://$instance.service-now.com/api/now/table/incident"

# Define the incident details
$incidentData = @{
    short_description = "Sample Incident Created via PowerShell"
    description = "This is a test incident created using PowerShell and REST API."
    urgency = "2"
    impact = "2"
} | ConvertTo-Json -Depth 10

# Create the HTTP headers
$headers = @{
    "Content-Type" = "application/json"
    "Accept" = "application/json"
}

# Make the API request to create the incident
$response = Invoke-RestMethod -Uri $apiUrl -Method Post -Headers $headers -Body $incidentData -Credential (Get-Credential)

# Output the response
Write-Output "Incident created successfully. Response:"
Write-Output $response
