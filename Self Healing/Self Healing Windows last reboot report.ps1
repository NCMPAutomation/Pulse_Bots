# Get the last boot-up time
$lastBootUpTime = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime

# Format the date and time
$formattedBootUpTime = $lastBootUpTime.ToString("yyyy-MM-dd HH:mm:ss")

# Output the last boot-up time
Write-Output "The server was last rebooted on: $formattedBootUpTime"