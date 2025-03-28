# Open the browser and navigate to the content page
Start-Process "chrome.exe" "https://example.com/content"

# Get the page source
Start-Sleep -Seconds 5
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("^a^c")
$pageSource = Get-Clipboard

# Save the page source to a file
$pageSource | Out-File "page_source.html"