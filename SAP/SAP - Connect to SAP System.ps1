# Load SAP .NET Connector assembly
Add-Type -Path "C:\Path\To\SapNco.dll"

# Define SAP connection parameters
$connectionParams = @{
    "ASHOST" = "sapserver"
    "SYSNR"  = "00"
    "CLIENT" = "100"
    "USER"   = "username"
    "PASSWD" = "password"
}

# Create SAP connection
$sapConnection = New-Object SAP.Middleware.Connector.RfcConfigParameters
foreach ($key in $connectionParams.Keys) {
    $sapConnection.Add($key, $connectionParams[$key])
}

# Open SAP connection
$sapDestination = [SAP.Middleware.Connector.RfcDestinationManager]::GetDestination($sapConnection)
$sapDestination.Ping()
Write-Output "Connected to SAP system"
