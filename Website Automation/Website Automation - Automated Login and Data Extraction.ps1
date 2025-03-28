# Open the browser and navigate to the login page
Start-Process "chrome.exe" "https://example.com/login"

# Log in to the account
Start-Sleep -Seconds 5
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("your_username{TAB}your_password{ENTER}")

# Navigate to the data page and extract data
Start-Sleep -Seconds 5
[System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{ENTER}")
Start-Sleep -Seconds 5
$data = Get-Clipboard

# Save the extracted data to a file
$data | Out-File "extracted_data.txt"