# Define ServiceNow instance details
$instance = "your_instance_name"  # Replace with your ServiceNow instance name
$username = "your_username"       # Replace with your ServiceNow username
$password = "your_password"       # Replace with your ServiceNow password

# Define the API endpoint for creating a new CMDB asset
$apiUrl = "https://$instance.service-now.com/api/now/table/cmdb_ci"

# Define the new CMDB asset details
$newAssetData = @{
    name = "New Server Asset"                     # Name of the asset
    serial_number = "SN1234567890"                # Serial number of the asset
    asset_tag = "AssetTag001"                     # Asset tag
    manufacturer = "Your Manufacturer Name"       # Manufacturer of the asset
    model_id = "Model Sys ID Here"                # Sys ID of the model in ServiceNow
    location = "Location Sys ID Here"             # Sys ID of the location
    install_status = "1"                          # Install status (e.g., "1" for Installed)
    assigned_to = "John.Doe@domain.com"           # User assigned to the asset (optional)
    comments = "Added via PowerShell and REST API"
} | ConvertTo-Json -Depth 10

# Create HTTP headers
$headers = @{
    "Content-Type" = "application/json"
    "Accept" = "application/json"
}

# Make the API request to add the new CMDB asset
$response = Invoke-RestMethod -Uri $apiUrl -Method Post -Headers $headers -Body $newAssetData -Credential (Get-Credential)

# Output the response
Write-Output "New CMDB asset added successfully. Response:"
Write-Output $response
