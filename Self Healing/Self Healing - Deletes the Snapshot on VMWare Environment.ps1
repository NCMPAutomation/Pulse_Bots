# Parameters
param (
    [string]$vCenterServer,
    [string]$vmName
)

# Connect to vCenter
Connect-VIServer -Server $vCenterServer

# Get the VM
$vm = Get-VM -Name $vmName

# Get and remove all snapshots for the VM
Get-Snapshot -VM $vm | Remove-Snapshot -Confirm:$false

Write-Host "All snapshots for VM $vmName have been deleted."

# Disconnect from vCenter
Disconnect-VIServer -Server $vCenterServer -Confirm:$false