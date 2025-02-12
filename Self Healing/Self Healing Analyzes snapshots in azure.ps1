#Snapshot history
# Connect to your Azure account
Connect-AzAccount
 
# Define the threshold in days
$thresholdDays = 45
 
# Get the current date
$currentDate = Get-Date
 
# Get all resource groups
$resourceGroup = 'net_devops_rg'
 
# Initialize an array to store old snapshots
$oldSnapshots = @()
 
# Loop through each resource group to get snapshots
    $snapshots = Get-AzSnapshot -ResourceGroupName $resourceGroup
    foreach ($snapshot in $snapshots) {
        if (($currentDate - $snapshot.TimeCreated).Days -gt $thresholdDays) {
            $oldSnapshots += $snapshot
        }
    }
 
# Display the old snapshots
$oldSnapshots | Select-Object ResourceGroupName, Name, TimeCreated