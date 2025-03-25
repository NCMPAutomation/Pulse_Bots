# Define variables
$VdaList = @("VDA1", "VDA2") # Replace with the names of your VDAs
$LogFile = "C:\Temp\CitrixHealthCheck.log"

# Step 1: Check VDA Registration
Write-Output "Checking VDA registration..." | Out-File -Append $LogFile
foreach ($Vda in $VdaList) {
    $VdaStatus = Test-Connection -ComputerName $Vda -Count 2 -Quiet
    if ($VdaStatus) {
        Write-Output "$Vda is reachable." | Out-File -Append $LogFile
    } else {
        Write-Output "$Vda is not reachable. Check network connectivity." | Out-File -Append $LogFile
    }
}

# Step 2: Check Citrix Services
Write-Output "Checking Citrix services..." | Out-File -Append $LogFile
$Services = @("Citrix Desktop Service", "Citrix ICA Service")
foreach ($Service in $Services) {
    $ServiceStatus = Get-Service -Name $Service -ErrorAction SilentlyContinue
    if ($ServiceStatus.Status -eq "Running") {
        Write-Output "$Service is running." | Out-File -Append $LogFile
    } else {
        Write-Output "$Service is not running. Investigate further." | Out-File -Append $LogFile
    }
}

# Step 3: Check Firewall Rules
Write-Output "Checking firewall rules..." | Out-File -Append $LogFile
$FirewallStatus = Get-NetFirewallRule -DisplayName "Citrix*" -ErrorAction SilentlyContinue
if ($FirewallStatus) {
    Write-Output "Citrix firewall rules are configured." | Out-File -Append $LogFile
} else {
    Write-Output "Citrix firewall rules are missing. Configure them." | Out-File -Append $LogFile
}

Write-Output "Health check completed. Review the log file at $LogFile."
