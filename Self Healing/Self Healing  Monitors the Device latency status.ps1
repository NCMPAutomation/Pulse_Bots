# Define the device name or IP address
$device = ""

# Number of pings to send
$pings = 5

# Ping the device and measure latency
$latencyResults = 1..$pings | ForEach-Object {
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

# Display the latency results
$latencyResults | Format-Table -AutoSize