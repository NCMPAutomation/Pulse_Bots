# Define the Azure VM details
$resourceGroupName = "net_devops_rg"
$vmName = "NewAutomationTestVM"
# Login to Azure account
Connect-AzAccount
# Get the VM object
$vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName
# Get the CPU usage metrics
$cpuMetrics = Get-AzMetric -ResourceId $vm.Id -MetricName "Percentage CPU" -TimeGrain (New-TimeSpan -Minutes 1) -StartTime (Get-Date).AddMinutes(-60) -EndTime (Get-Date)
# Display the CPU usage metrics
$cpuMetrics.Data | Select-Object TimeStamp, Average -Last 5 | Format-Table -AutoSize