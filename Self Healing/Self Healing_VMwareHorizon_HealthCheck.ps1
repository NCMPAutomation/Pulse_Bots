# Define variables
$horizonServer = "https://horizon.example.com" # Replace with your Horizon server URL
$username = "admin"                            # Horizon username
$password = "password"                         # Horizon password
$reportPath = "C:\Temp\HorizonHealthCheck.html" # Path to save the report

# Step 1: Connect to VMware Horizon
Write-Output "Connecting to VMware Horizon..."
Connect-HVServer -Server $horizonServer -User $username -Password $password

# Step 2: Check Connection Server Health
Write-Output "Checking Connection Server health..."
$connectionServers = Get-HVConnectionServer
$connectionServers | Out-File -FilePath $reportPath -Append

# Step 3: Monitor Desktop Pools
Write-Output "Checking desktop pool health..."
$pools = Get-HVPool
$pools | Out-File -FilePath $reportPath -Append

# Step 4: Assess Session Health
Write-Output "Checking session health..."
$sessions = Get-HVSession
$sessions | Out-File -FilePath $reportPath -Append

Write-Output "Health check completed. Review the report at $reportPath."
