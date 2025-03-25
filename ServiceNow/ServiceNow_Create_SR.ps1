# Define ServiceNow instance details
$instance = "your_instance_name"  # Replace with your ServiceNow instance name
$username = "your_username"       # Replace with your ServiceNow username
$password = "your_password"       # Replace with your ServiceNow password

# Define the API endpoint for creating a Service Request
$apiUrl = "https://$instance.service-now.com/api/now/table/sc_request"

# Define the Service Request details
$requestData = @{
    short_description = "Request for new laptop"        # Modify as per your requirement
    description = "This is a request to order a new laptop for John Doe."
    requested_for = "john.doe@domain.com"               # Requested for user
    assignment_group = "IT Support"                    # Relevant assignment group
} | ConvertTo-Json -Depth 10

# Create the HTTP headers
$headers = @{
    "Content-Type" = "application/json"
    "Accept" = "application/json"
}

# Make the API request to create the Service Request
$response = Invoke-RestMethod -Uri $apiUrl -Method Post -Headers $headers -Body $requestData -Credential (Get-Credential)

# Output the response
Write-Output "Service Request created successfully. Response:"
Write-Output $response
