# Open the browser and navigate to the website
Start-Process "chrome.exe" "https://example.com"

# Measure the page load time
$startTime = Get-Date
Start-Sleep -Seconds 5
$endTime = Get-Date
$loadTime = $endTime - $startTime

# Save the load time to a file
$loadTime.ToString() | Out-File "load_time.txt"