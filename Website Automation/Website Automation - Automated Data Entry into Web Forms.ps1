# Open the browser and navigate to the web form
Start-Process "chrome.exe" "https://example.com/form"

# Fill in the form fields
Start-Sleep -Seconds 5
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("John Doe{TAB}john.doe@example.com{TAB}This is an automated message.{TAB}{ENTER}")