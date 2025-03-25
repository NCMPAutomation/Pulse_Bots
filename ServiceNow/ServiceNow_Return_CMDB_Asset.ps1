# Define ServiceNow instance details
$instance = "your_instance_name"  # Replace with your ServiceNow instance name
$username = "your_username"       # Replace with your ServiceNow username
$password = "your_password"       # Replace with your ServiceNow password

# Define the API endpoint to retrieve a CMDB asset
$assetSysID = "your_asset_sys_id"  # Replace with the Sys ID of the CMDB asset to fetch
$apiUrl = "https://$instance.service-now.com/api/now/table/cmdb_ci/$assetSysID"

# Create HTTP headers
$headers = @{
    "Content-Type" = "application/json"
    "Accept" = "application/json"
}

# Make the API request to get the CMDB asset details
$response = Invoke-RestMethod -Uri $apiUrl -Method Get -Headers $headers -Credential (Get-Credential)

# Output the asset details
Write-Output "CMDB Asset Details:"
Write-Output $response
