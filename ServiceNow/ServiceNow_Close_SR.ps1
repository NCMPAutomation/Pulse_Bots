# Define ServiceNow instance details
$instance = "your_instance_name"  # Replace with your ServiceNow instance name
$username = "your_username"       # Replace with your ServiceNow username
$password = "your_password"       # Replace with your ServiceNow password

# Define the API endpoint for updating the Service Request
$requestId = "REQ0012345"          # Replace with the Request Number or Sys ID
$apiUrl = "https://$instance.service-now.com/api/now/table/sc_request/$requestId"

# Define the data for closing the request
$closeData = @{
    state = "3"                        # State '3' typically represents "Closed Complete"
    close_notes = "Service Request completed successfully and is now closed."
} | ConvertTo-Json -Depth 10

# Create HTTP headers
$headers = @{
    "Content-Type" = "application/json"
    "Accept" = "application/json"
}

# Make the API request to close the Service Request
$response = Invoke-RestMethod -Uri $apiUrl -Method Patch -Headers $headers -Body $closeData -Credential (Get-Credential)

# Output the response
Write-Output "Service Request closed successfully. Response:"
Write-Output $response
