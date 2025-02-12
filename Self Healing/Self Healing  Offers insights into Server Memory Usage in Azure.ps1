# Define the Azure VM details
$resourceGroupName = ""
$vmName = ""
# Login to Azure account
Connect-AzAccount
# Get the VM object
$vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName
 
# Get the memory usage metrics
$memoryMetrics = Get-AzMetric -ResourceId $vm.Id -MetricName "Available Memory Bytes" -TimeGrain (New-TimeSpan -Minutes 1) -StartTime (Get-Date).AddMinutes(-60) -EndTime (Get-Date)
 
# Get the total memory of the VM
$totalMemory = (Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName).HardwareProfile.VmSize | Get-AzVMSize -Location $vm.Location | Select-Object -ExpandProperty MemoryInMB
 
 
$vm_size = (Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName).HardwareProfile.VmSize 
$vm_type = Get-AzVMSize -Location $vm.Location 
$all_mem_utlization = foreach($vm_standard_size in $vm_type){
if ($vm_standard_size.Name -eq $vm_size){
    $totalMemory =$vm_standard_size.MemoryInMB
    $memoryMetrics.Data | ForEach-Object {
    $usedMemoryBytes = $totalMemory * 1MB - $_.Average
    $usedMemoryPercentage = ($usedMemoryBytes / ($totalMemory * 1MB)) * 100
    [PSCustomObject]@{
        TimeStamp = $_.TimeStamp
        UsedMemoryPercentage = [math]::round($usedMemoryPercentage, 2)
    }
} | Format-Table -AutoSize
}
}
$all_mem_utlization | Select-Object -First 10