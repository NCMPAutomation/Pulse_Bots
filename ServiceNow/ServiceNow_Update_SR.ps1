# Define ServiceNow instance details
$instance = "your_instance_name"  # Replace with your ServiceNow instance name
$username = "your_username"       # Replace with your ServiceNow username
$password = "your_password"       # Replace with your ServiceNow password

# Define the API endpoint for updating a Service Request
$requestId = "REQ0012345"          # Replace with the Request Number or Sys ID
$apiUrl = "https://$instance.service-now.com/api/now/table/sc_request/$requestId"

# Define the data for updating the request
$updateData = @{
    state = "2"                      # Change state, e.g., "2" could mean "In Progress"
    comments = "Updated request details to reflect new requirements."
    assigned_to = "it.support@domain.com"  # Assign to a specific user (optional)
} | ConvertTo-Json -Depth 10

# Create HTTP headers
$headers = @{
    "Content-Type" = "application/json"
    "Accept" = "application/json"
}

# Make the API request to update the Service Request
$response = Invoke-RestMethod -Uri $apiUrl -Method Patch -Headers $headers -Body $updateData -Credential (Get-Credential)

# Output the response
Write-Output "Service Request updated successfully. Response:"
Write-Output $response
