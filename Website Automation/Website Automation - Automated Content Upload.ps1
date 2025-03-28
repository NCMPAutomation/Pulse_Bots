# Open the browser and navigate to the content upload page
Start-Process "chrome.exe" "https://example.com/upload"

# Log in to the account
Start-Sleep -Seconds 5
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("your_username{TAB}your_password{ENTER}")

# Upload the content file
Start-Sleep -Seconds 5
[System.Windows.Forms.SendKeys]::SendWait("{TAB}C:\path\to\content.txt{ENTER}")

# Log out and close the browser
Start-Sleep -Seconds 5
[System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{ENTER}")