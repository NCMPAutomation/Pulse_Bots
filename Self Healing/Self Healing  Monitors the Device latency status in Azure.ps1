#script that has to run in invoke block
param (
    [string]$device,
    [int]$pings
)
$device = '4.240.50.82'
$pings = 5
 
$pings | ForEach-Object {
    $ping = Test-Connection -ComputerName $device -Count 1 -ErrorAction SilentlyContinue
    if ($ping) {
        [PSCustomObject]@{
            TimeStamp = Get-Date
            Latency = $ping.ResponseTime
        }
    } else {
        [PSCustomObject]@{
            TimeStamp = Get-Date
            Latency = "Request Timed Out"
        }
    }
}


##########################################################################################

#Latency Status in Azure
# Define the Azure VM details
$resourceGroupName = "net_devops_rg"
$vmName = "NewAutomationTestVM"
 
# Define the device name or IP address
$device = "4.240.50.82"
 
# Number of pings to send
$pings = 5
 
# Login to Azure account
Connect-AzAccount
 
# Path to the local script file
$scriptPath = "C:\Users\Admin\Downloads\test_az_invoke.ps1"
 
# Invoke the script on the Azure VM
$latencyResults = Invoke-AzVMRunCommand -ResourceGroupName 'net_devops_rg' -VMName 'NewAutomationTestVM' -CommandId 'RunPowerShellScript' -ScriptPath $scriptPath -Parameter @{"device" = "4.240.50.82"; "pings"=$pings}
 
# Display the latency results
$latencyResults.Valueclear | Format-Table -AutoSize