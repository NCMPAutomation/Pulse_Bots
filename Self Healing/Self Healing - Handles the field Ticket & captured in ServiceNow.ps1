# Parameters
param (
    [string]$serviceNowInstance,
    [string]$username,
    [string]$password,
    [string]$shortDescription,
    [string]$description,
    [string]$callerId
)

# ServiceNow API endpoint
$uri = "https://$serviceNowInstance.service-now.com/api/now/table/incident"

# Create the request body
$body = @{
    short_description = $shortDescription
    description = $description
    caller_id = $callerId
} | ConvertTo-Json

# Create the headers
$headers = @{
    "Content-Type" = "application/json"
    "Accept" = "application/json"
}

# Make the API call to create the incident
$response = Invoke-RestMethod -Uri $uri -Method Post -Headers $headers -Body $body -Credential (New-Object System.Management.Automation.PSCredential($username, (ConvertTo-SecureString $password -AsPlainText -Force)))

# Output the response
$response | Format-List