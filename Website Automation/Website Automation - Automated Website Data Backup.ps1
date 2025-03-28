# Open the browser and navigate to the data export page
Start-Process "chrome.exe" "https://example.com/export"

# Log in to the account
Start-Sleep -Seconds 5
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("your_username{TAB}your_password{ENTER}")

# Export the data
Start-Sleep -Seconds 5
[System.Windows.Forms.SendKeys]::SendWait("{TAB}{ENTER}")

# Save the exported data to a file
Start-Sleep -Seconds 10
$exportedData = Get-Clipboard
$exportedData | Out-File "exported_data.csv"