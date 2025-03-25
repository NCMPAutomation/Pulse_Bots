# Define ServiceNow instance details
$instance = "your_instance_name"  # Replace with your ServiceNow instance name
$username = "your_username"       # Replace with your ServiceNow username
$password = "your_password"       # Replace with your ServiceNow password

# Define the API endpoint for creating a Request Item
$apiUrl = "https://$instance.service-now.com/api/now/table/sc_req_item"

# Define the Request Item details
$requestData = @{
    short_description = "Request for new software license"
    description = "This is a request for a new software license for Adobe Photoshop."
    assignment_group = "Software Management Team"        # Replace with the appropriate assignment group
    requested_for = "john.doe@domain.com"                # Replace with the user requesting the item
    catalog_item = "Software License Request"            # Replace with the catalog item name or Sys ID (optional)
} | ConvertTo-Json -Depth 10

# Create HTTP headers
$headers = @{
    "Content-Type" = "application/json"
    "Accept" = "application/json"
}

# Make the API request to create the Request Item
$response = Invoke-RestMethod -Uri $apiUrl -Method Post -Headers $headers -Body $requestData -Credential (Get-Credential)

# Output the response
Write-Output "Request Item created successfully. Response:"
Write-Output $response
