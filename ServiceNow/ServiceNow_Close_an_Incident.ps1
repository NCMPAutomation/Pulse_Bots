# Define ServiceNow instance details
$instance = "your_instance_name"  # Replace with your ServiceNow instance name
$username = "your_username"       # Replace with your ServiceNow username
$password = "your_password"       # Replace with your ServiceNow password

# Define the API endpoint for updating incidents
$incidentId = "INC0012345"        # Replace with the Incident Number or Sys ID
$apiUrl = "https://$instance.service-now.com/api/now/table/incident/$incidentId"

# Define the incident update details
$updateData = @{
    state = "7"                       # State '7' indicates "Closed" in ServiceNow
    close_notes = "Issue resolved and incident closed"
    resolved_by = "System Administrator"  # Replace with appropriate user
} | ConvertTo-Json -Depth 10

# Create the HTTP headers
$headers = @{
    "Content-Type" = "application/json"
    "Accept" = "application/json"
}

# Make the API request to update the incident
$response = Invoke-RestMethod -Uri $apiUrl -Method Patch -Headers $headers -Body $updateData -Credential (Get-Credential)

# Output the response
Write-Output "Incident updated successfully. Response:"
Write-Output $response
