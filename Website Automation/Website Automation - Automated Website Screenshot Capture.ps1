# Open the browser and navigate to the website
Start-Process "chrome.exe" "https://example.com"

# Capture a screenshot
Start-Sleep -Seconds 5
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("{PRTSC}")

# Save the screenshot to a file
$screenshot = Get-Clipboard
$screenshot.Save("screenshot.png")