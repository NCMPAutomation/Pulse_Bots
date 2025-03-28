# Open the browser and navigate to the registration page
Start-Process "chrome.exe" "https://example.com/register"

# Fill in the registration form
Start-Sleep -Seconds 5
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("new_user{TAB}new_user@example.com{TAB}secure_password{TAB}{ENTER}")