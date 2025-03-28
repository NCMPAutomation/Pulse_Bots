# Check the status of the Windows Update service
$serviceStatus = Get-Service -Name wuauserv

Write-Host "Windows Update Service Status: $($serviceStatus.Status)"