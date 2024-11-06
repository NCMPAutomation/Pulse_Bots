# Connect to your Azure account
Connect-AzAccount -Credential $azure_cred -Subscription SUBSCRIPTION_ID

# Define the resource group and volume name
$resourceGroupName = "your_resource_group_name"
$volumeName = "your_volume_name"

# Get the snapshots for the specified volume
$snapshots = Get-AzSnapshot | Where-Object { $_.ResourceGroupName -eq $resourceGroupName -and $_.Name -like "*$volumeName*" }

# Display the snapshots
$snapshots | Select-Object Name, TimeCreated, Location, DiskSizeGB
