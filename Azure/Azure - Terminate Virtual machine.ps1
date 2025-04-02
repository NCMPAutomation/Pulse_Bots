# Connect to your Azure account
Connect-AzAccount

# Variables
$resourceGroupName = "myResourceGroup"
$vmName = "myWindowsVM"

# Start the VM
Start-AzVM -ResourceGroupName $resourceGroupName -Name $vmName

# Check the status of the VM
$vmStatus = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName -Status
$vmStatus.Statuses
